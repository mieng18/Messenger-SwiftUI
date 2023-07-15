//
//  InboxRowView.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/15/23.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        
        HStack(alignment: .top,spacing: 12){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width:64 ,height: 64)
                .foregroundColor(Color(.systemGray4))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Maii Ng")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                   
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100,alignment: .leading)
                
            }
            
            HStack{
                Text("Yesterday")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
            
        }
        .frame(height: 72)
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
