//
//  ChatView.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/16/23.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CircularProfileImageView(user: User.MOCK_USER, size: .xLarge)
                    VStack(spacing:4) {
                        Text("Maii Ng")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            
                        
                    }
                }
                
                ForEach(0...15,id:\.self) { message in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                }
            }
        Spacer()
        
        ZStack(alignment: .trailing){
            TextField("Message...",text: $messageText,axis: .vertical)
                .padding(12)
                .padding(.trailing,48)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
                .font(.subheadline)
            
            Button{
                print("Send Message")
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
        ChatView()
    }
}
