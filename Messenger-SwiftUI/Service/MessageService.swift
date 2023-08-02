//
//  MessageService.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 8/1/23.
//

import Foundation
import Firebase


struct MessageService {
    let messageCollection = Firestore.firestore().collection("messages")
    
    func sendMessage(_ messageText: String, toUser user: User) {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        
        let charPartnerId = user.id
        
        let currentUserRef = messageCollection.document(currentUid).collection(charPartnerId).document()
        let chatParnerRef = messageCollection.document(charPartnerId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(messageId:messageId,fromId: currentUid, toId: charPartnerId, messageText: messageText, timestamp: Timestamp())
        
        guard let messageData = try? Firestore.Encoder().encode(message) else {return}
            currentUserRef.setData(messageData)
            chatParnerRef.document(messageId).setData(messageData)
            
    }
}
