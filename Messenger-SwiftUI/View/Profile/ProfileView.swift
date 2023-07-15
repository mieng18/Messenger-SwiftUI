//
//  ProfileView.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/15/23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            VStack {
                
                PhotosPicker(selection: $viewModel.selectedImage) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80,height: 80)
                            .foregroundColor(Color(.systemGray4))
                            .clipShape(Circle())
                        
                    } else {
                        Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 80,height: 80)
                        .foregroundColor(Color(.systemGray4))
                    }
                    
                }
                   
                
                Text("Maii Ng")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            List {
                Section{
                    ForEach(SettingsOptionsViewModel.allCases,id: \.self) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24,height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                            
                        }
                    }
                }
                
                Section{
                    Button("Log out") {
                        
                    }
                    .foregroundColor(.gray)
                    
               
                    
                }
                
            }
            
        }
    
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
