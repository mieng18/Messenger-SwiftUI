//
//  ActiveNowViewModel.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 8/4/23.
//

import Foundation


class ActiveNowViewModel: ObservableObject {
    @Published var users = [User]()
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchAllUsers(limit: 10)
    }
    
}
