//
//  User.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/16/23.
//

import Foundation


struct User: Codable, Identifiable,Hashable {
    var id = NSUUID().uuidString
    var fullname: String
    var email: String
    var profileImageUrl: String?
    
}

extension User {
    static let MOCK_USER = User(fullname: "Maii Ng", email: "maiing@gmail.com",profileImageUrl: "profile-pic")
}

