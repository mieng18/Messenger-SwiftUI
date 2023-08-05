//
//  User.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/16/23.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Codable, Identifiable,Hashable {
    @DocumentID var uid: String?
    var fullname: String
    var email: String
    var profileImageUrl: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
    
    var firstName: String {
        let formater = PersonNameComponentsFormatter()
        let components = formater.personNameComponents(from: fullname)
        return components?.givenName ?? fullname
    }
    
}

extension User {
    static let MOCK_USER = User(fullname: "Maii Ng", email: "maiing@gmail.com",profileImageUrl: "profile-pic")
}

