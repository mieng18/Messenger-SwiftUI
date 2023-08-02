//
//  Message.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 8/1/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable,Codable,Hashable {
    @DocumentID var messageID: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String{
        return messageID ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String {
        return fromId ?? NSUUID().uuidString
    }
    
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
}

