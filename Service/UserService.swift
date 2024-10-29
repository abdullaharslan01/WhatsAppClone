//
//  UserService.swift
//  whatsAppClone
//
//  Created by abdullah on 24.10.2024.
//

import Firebase
import FirebaseFirestore
import Foundation
import FirebaseAuth

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    private var userCollection = Firestore.firestore().collection("users")
    
    private func getCurrentUserReferance(with id:String)-> DocumentReference {
        return userCollection.document(id)
    }
    

    @MainActor
    func fetchCurrentUsert() async throws {
        guard let uid = AuthService.shared.getCurrentUserUid else { return }
        let snapshot = try await getCurrentUserReferance(with: uid).getDocument()
        guard let userData = try? snapshot.data(as: User.self)else{ return}
        currentUser = userData
    }
    
    
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        try await getCurrentUserReferance(with: uid).updateData(["profileImageUrl":imageUrl])
        self.currentUser?.profileImageUrl = imageUrl
        
    }
    
    
    @MainActor
    func fetchAllUsers()async throws -> [User] {
        let snapshots = try await userCollection.getDocuments()
        
        return snapshots.documents.compactMap { try? $0.data(as: User.self)
        }
    }
    
    
    
}
