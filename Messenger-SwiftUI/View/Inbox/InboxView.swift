//
//  InboxView.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/15/23.
//

import SwiftUI

struct InboxView: View {
    @State private var user = User.MOCK_USER
    @State private var showNewMessageView  = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ActiveNowView()
                
                List(0...10, id: \.self) { message in
                    InboxRowView()
                }
                .listStyle(PlainListStyle())
                .frame(height: screenhHeight - 120 )
                
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user:user)
            })
            .fullScreenCover(isPresented: $showNewMessageView,content: {
                NewMessageView()
            })
            .padding(.all,16)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        NavigationLink(value: user) {
                            CircularProfileImageView(user: user, size: .xSmall)
                            
                        }
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement:.navigationBarTrailing) {
                    
                    Button{
                        showNewMessageView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32,height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                   
                }
            }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
