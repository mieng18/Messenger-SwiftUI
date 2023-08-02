//
//  ProfileViewModel.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/15/23.
//

import SwiftUI
import PhotosUI

class ProfileViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                try await loadImage()
            }
        }
    }
    
    @Published var profileImage: Image?
    
    func loadImage() async throws {
        guard let image = selectedImage else {return}
        
        guard let imageData = try await image.loadTransferable(type: Data.self) else {return}
        
        guard let uiImage = UIImage(data: imageData) else {return}
        self.profileImage = Image(uiImage:uiImage)
    }
}
