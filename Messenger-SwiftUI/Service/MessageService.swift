//
//  MessageService.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 8/1/23.
//

import Foundation
import Firebase


struct MessageService {
    static let messagesCollection = Firestore.firestore().collection("messages")
    
    static func sendMessage(_ messageText: String, toUser user: User) {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        
        let charPartnerId = user.id
        
        let currentUserRef = messagesCollection.document(currentUid).collection(charPartnerId).document()
        let chatParnerRef = messagesCollection.document(charPartnerId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(messageId:messageId,fromId: currentUid, toId: charPartnerId, messageText: messageText, timestamp: Timestamp())
        
        guard let messageData = try? Firestore.Encoder().encode(message) else {return}
            currentUserRef.setData(messageData)
            chatParnerRef.document(messageId).setData(messageData)
            
    }
    
    static func observeMessages(chatPartner: User,completion: @escaping([Message]) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let chatPartnerId = chatPartner.id
        let query = messagesCollection
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
