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
}
