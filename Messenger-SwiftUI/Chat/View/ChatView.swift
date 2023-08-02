//
//  ChatView.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/16/23.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user:user))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CircularProfileImageView(user: user, size: .xLarge)
                    VStack(spacing:4) {
                        Text(user.fullname)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            
                        
                    }
                }
                
                ForEach(viewModel.messages) { message in
                    ChatMessageCell(message: message)
                }
            }
        Spacer()
        
        ZStack(alignment: .trailing){
            TextField("Message...",text: $viewModel.messageText,axis: .vertical)
                .padding(12)
                .padding(.trailing,48)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
                .font(.subheadline)
            
            Button{
                viewModel.sendMessage()
                viewModel.messageText = ""
            } label: {
                 Text("Send")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
            
            
        }
        .padding()
        }

    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: User.MOCK_USER)
    }
}
