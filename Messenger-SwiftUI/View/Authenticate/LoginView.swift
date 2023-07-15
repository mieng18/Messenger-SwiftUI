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
            VStack(spacing: 16) {
                Spacer()
                
                Image("messenger")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height:100)
                    .padding()
                
                VStack{
                    CustomTextField(text: $email, placeholder: "Enter your email")
                  
                    
                    CustomSecureField(text: $password, placeholder: "Password")
                }
                .padding(.horizontal,16)
                
                Button (action:{
                    print("Handle Login")

                }
                ){
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .padding(.top)
                        .padding(.trailing,28)
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                
                
                Button {
                    print("Handle Login")

                } label:{
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360,height: 44)
                        .background(.blue)
                        .cornerRadius(10)
                }
                
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40,height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40,height: 0.5)
                }
                .foregroundColor(.grayText868585)
                
                HStack(spacing:8){
                 
                    Image("facebook")
                        .resizable()
                        .frame(width: 20,height:20)
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)

                }
                .padding(.top,8)
                
                Spacer()
                
                
                Divider()
                NavigationLink{
                    Text("Sign up View")
                    
                    
                } label: {
                    HStack(spacing:3) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)

                        
                    }
                }
                .padding(.vertical)
                
                
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
                    .font(.subheadline)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.leading,18)
                    .textInputAutocapitalization(.never)
            }
            
            HStack {
                
                TextField("", text: $text)
                    .font(.subheadline)
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
                    .font(.subheadline)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.leading,18)
                    .textInputAutocapitalization(.never)
            }
            
            HStack {
            
                SecureField("", text: $text)
                    .font(.subheadline)
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

