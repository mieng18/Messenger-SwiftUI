//
//  LoginView.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/15/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                
                Image("messenger")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height:100)
                    .padding()
                
                VStack{
                    CustomTextField(text: $email, placeholder: "Enter your email")
                  
                    
                    CustomSecureField(text: $password, placeholder: "Password")
                }
                .padding(.all,16)

           }
        }
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack (alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.leading,18)
                    .textInputAutocapitalization(.never)
            }
            
            HStack {
                
                TextField("", text: $text)
                    .foregroundColor(.black.opacity(0.9))
                    .autocapitalization(.none)
                    .padding(.leading,0 )
                    .textInputAutocapitalization(.none)
            }
            .padding(.all,10)
            .padding(.horizontal, 5)
            .background(.gray.opacity(0.1))
            .cornerRadius(8)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.purple, Color.blue]
                ),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            
            VStack {
                CustomTextField(
                    text: .constant(""), placeholder: "My placeholder"
                )
            }.padding()
        }
    }
}


struct CustomSecureField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack (alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.leading,18)
                    .textInputAutocapitalization(.never)
            }
            
            HStack {
            
                SecureField("", text: $text)
                    .foregroundColor(.black.opacity(0.9))
                    .padding(.leading,0)
                    .textInputAutocapitalization(.never)
            }
            .padding(.all,10)
            .padding(.horizontal, 5)
            .background(.gray.opacity(0.1))
            .cornerRadius(8)
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.purple, Color.blue]
                ),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            
            VStack {
                CustomSecureField(
                    text: .constant(""), placeholder: "My placeholder"
                )
            }.padding()
        }
    }
}

