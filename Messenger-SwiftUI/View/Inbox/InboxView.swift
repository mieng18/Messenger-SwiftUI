//
//  InboxView.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/15/23.
//

import SwiftUI

struct InboxView: View {
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
            .padding(.all,16)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement:.navigationBarTrailing) {
                    
                    Button{
                        print("Show new message view")
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