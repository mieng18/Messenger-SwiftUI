//
//  ChatViewModel.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 8/1/23.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    @Published var messages = [Message]()

    let user: User
    
    init(user: User) {
        self.user = user
        observerMessages()
    }
  
    
    func observerMessages() {
        MessageService.observeMessages(chatPartner:user) { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText,toUser: user)
    }
}
