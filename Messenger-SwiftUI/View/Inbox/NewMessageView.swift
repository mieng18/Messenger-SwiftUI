//
//  NewMessageView.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/15/23.
//

import SwiftUI

struct NewMessageView: View {
    
    @StateObject private var viewModel = NewMessageViewModel()
    @Binding var selectedUser: User?
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                TextField("To: ",text:$searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("CONTACTS")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                
                
                ForEach(viewModel.users,id:\.self) { user in
                    VStack{
                        HStack {
                            CircularProfileImageView(user: User.MOCK_USER, size: .small)
                            Text("Maii Ng")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading,40)
                    }
                    .onTapGesture {
                        selectedUser = user
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(selectedUser: .constant(User.MOCK_USER))
    }
}
