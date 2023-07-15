//
//  ProfileView.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/15/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80,height: 80)
                    .foregroundColor(Color(.systemGray4))
                
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
