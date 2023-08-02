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

    let service: ChatService
    
    init(user: User) {
        self.service = ChatService(chatPartner: user)
        observerMessages()
    }
  
    
    func observerMessages() {
        service.observeMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage() {
        service.sendMessage(messageText)
    }
}
