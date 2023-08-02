//
//  LoginViewModel.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/16/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.logIn(withEmail: email, password: password)
    }
    
}
