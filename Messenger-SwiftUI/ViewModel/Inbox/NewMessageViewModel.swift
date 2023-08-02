//
//  NewMessageViewModel.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 8/1/23.
//

import SwiftUI
import Firebase

@MainActor
class NewMessageViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init(){
        Task{try await  fetchUsers()}
    }
    func fetchUsers()  async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let users = try await UserService.shared.fetchAllUsers()
        self.users = users.filter({$0.id != currentUid})
    }
    
}
