//
//  RegistrationViewModel.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/16/23.
//

import Foundation
import Firebase

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""

    
    
    func createUser() async throws {
        try await AuthService().createUser(withEmail: email, password: password, fullname: fullname)

       
    }
}
