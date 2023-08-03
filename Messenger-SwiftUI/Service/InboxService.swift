//
//  InboxService.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 8/3/23.
//

import Foundation
import Firebase


class InboxService {
    @Published var documentChanged = [DocumentChange]()
    
    
    func observeRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else{return}
        let query = FirestoreConstants
            .messagesCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp",descending:  true)
        
        query.addSnapshotListener{ snapshot ,_ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added || $0.type == .modified
            }) else{return}
            
            self.documentChanged = changes
        }
        
    }
}
