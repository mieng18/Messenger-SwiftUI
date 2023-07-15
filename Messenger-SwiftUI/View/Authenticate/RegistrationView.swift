//
//  RegistrationView.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/15/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        
        VStack(spacing:16) {
            Image("messenger")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height:100)
                .padding()
            
            VStack{
                CustomTextField(text: $email, placeholder: "Enter your email")
                CustomTextField(text: $email, placeholder: "Enter your fullname")
                
                
                CustomSecureField(text: $password, placeholder: "Password")
            }
                
                Button {
                    print("Handle Login")

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
