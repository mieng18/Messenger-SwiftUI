//
//  FirestoreConstants.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 8/2/23.
//

import Foundation
import Firebase

struct FirestoreConstants{
    static let userCollection = Firestore.firestore().collection("users")
    static let messagesCollection = Firestore.firestore().collection("messages")
    
}
