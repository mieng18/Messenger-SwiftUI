//
//  RegistrationView.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/15/23.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    var body: some View {
        
        VStack(spacing:16) {
            Image("messenger")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height:100)
                .padding()
            
            VStack{
                CustomTextField(text: $viewModel.email, placeholder: "Enter your email")
                CustomTextField(text: $viewModel.fullname, placeholder: "Enter your fullname")
                
                
                CustomSecureField(text: $viewModel.password, placeholder: "Password")
            }
                
                Button {
                    Task{
                        try await viewModel.createUser()
                    }

                } label:{
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360,height: 44)
                        .background(.blue)
                        .cornerRadius(10)
                }
                
              
                
                Spacer()
                
                
                Divider()
                NavigationLink{
                    Text("Sign In View")
                    
                    
                } label: {
                    HStack(spacing:3) {
                        Text("Already have an account?")
                        
                        Text("Sign In")
                            .fontWeight(.semibold)


                    }
                    .foregroundColor(.blue)
                }
                .padding(.vertical)
            }
            .padding(.horizontal,16)
            
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
