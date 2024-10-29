//
//  AuthService.swift
//  whatsAppClone
//
//  Created by abdullah on 22.10.2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

final class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    private let userCollection = Firestore.firestore().collection("users")
    
    static var shared = AuthService()
    
    var getCurrentUserUid: String? {
        return Auth.auth().currentUser?.uid
    }
    
    private init() { self.userSession = Auth.auth().currentUser }
    
    @MainActor
    func createUser(email:String, password:String,fullName:String,phoneNumber:String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
        uploadData(email: email, fullName: fullName, phoneNumber: phoneNumber, id: result.user.uid)
    }
    
   
    private func uploadData(email:String, fullName:String,phoneNumber:String,id:String) {
        let user = User(id: id, fullname: fullName, email: email, phoneNumber: phoneNumber, profileImageUrl: "")
        try? userCollection.document(id).setData(from: user)
    }
    
    
    @MainActor
    func login(email:String,password:String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        userSession = result.user
        loadUserData()
    }
 
    
    private func loadUserData(){
        Task {
            try? await UserService.shared.fetchCurrentUsert()
        }
    }
    
    func logout(){
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.currentUser = nil
    }
    
}

