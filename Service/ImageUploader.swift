//
//  ImageUploader.swift
//  whatsAppClone
//
//  Created by abdullah on 27.10.2024.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    
    
    static func uploadProfileImage(uiImage:UIImage) async throws -> String? {
        guard let imageData = uiImage.jpegData(compressionQuality: 0.25) else {return nil}
        
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(UUID().uuidString)")
        
        do {
            _ = try await storageRef.putDataAsync(imageData)
            
            let url = try await storageRef.downloadURL()
            return url.absoluteString
            
        } catch {
            print("failed to upload image \(error.localizedDescription)")
            return nil
        }
        
    }
}
