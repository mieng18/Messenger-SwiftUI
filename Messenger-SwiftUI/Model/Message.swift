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
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String{
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String {
        return toId ?? NSUUID().uuidString
    }
    
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
    
    var timestampString: String {
        return timestamp.dateValue().timestampString()
    }
}

