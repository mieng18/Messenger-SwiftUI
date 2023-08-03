//
//  ChatService.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 8/2/23.
//

import Foundation
import Firebase

struct ChatService {
    
    let chatPartner: User
    
    func sendMessage(_ messageText: String) {
    
        guard let currentUid = Auth.auth().currentUser?.uid else {return}


        let charPartnerId = chatPartner.id

        let currentUserRef = FirestoreConstants.messagesCollection.document(currentUid).collection(charPartnerId).document()
        let chatParnerRef = FirestoreConstants.messagesCollection.document(charPartnerId).collection(currentUid)
        
        let recentCurrentUserRef = FirestoreConstants.messagesCollection.document(currentUid).collection("recent-messages").document(charPartnerId)
        let recentPartnerRef = FirestoreConstants.messagesCollection.document(charPartnerId).collection("recent-messages").document(currentUid)


        let messageId = currentUserRef.documentID

        let message = Message(
            messageId:messageId,
            fromId: currentUid,
            toId: charPartnerId,
            messageText: messageText,
            timestamp: Timestamp())

        guard let messageData = try? Firestore.Encoder().encode(message) else {return}
        currentUserRef.setData(messageData)
        chatParnerRef.document(messageId).setData(messageData)
        
        recentCurrentUserRef.setData(messageData)
        recentPartnerRef.setData(messageData)

    }
    
    func observeMessages(completion: @escaping([Message]) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let chatPartnerId = chatPartner.id
        let query = FirestoreConstants.messagesCollection
            .document(currentUid)
            .collection(chatPartnerId)
            .order(by:"timestamp",descending: false)
        
        //get update real-time chat
        query.addSnapshotListener{ snapshot,_ in
            guard let changes = snapshot?.documentChanges.filter ({$0.type == .added }) else {return}
            var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
            
            
            for (index, message) in messages.enumerated()  where !message.isFromCurrentUser {
                messages[index].user = chatPartner
                
            }
            completion(messages)
            
        }
          
    }
}
