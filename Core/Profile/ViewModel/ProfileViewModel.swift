//
//  ProfileViewModel.swift
//  whatsAppClone
//
//  Created by abdullah on 21.10.2024.
//

import SwiftUI
import PhotosUI

final class ProfileViewModel: ObservableObject {
    
    @Published var tabbarVisibility:Visibility = .hidden
    
    @Published var showPhotoPicker: Bool = false
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { try await loadImage(withItem: selectedImage) } }}
    
    
    @Published var profileImage:Image?
    
    
    private func loadImage(withItem item: PhotosPickerItem?) async throws {
                
        guard let item = item,
              let data = try await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data) else{return}
        self.profileImage = Image(uiImage:uiImage )
        
        try await updateProfileImage(uiImage: uiImage)
        
    }
    
    private func updateProfileImage(uiImage:UIImage) async throws{
        guard let imageUrl = try await ImageUploader.uploadProfileImage(uiImage: uiImage) else {return}
        
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
    
}
