//
//  NewMessageViewModel.swift
//  whatsAppClone
//
//  Created by abdullah on 27.10.2024.
//

import FirebaseAuth
import Foundation

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var loading:Bool = false
    
    init(){
        Task {
            try await self.fetchContacts()
        }
    }
    
    @MainActor
    private func fetchContacts() async throws {
        loading.toggle()
        let users = try await UserService.shared.fetchAllUsers()
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        loading.toggle()
        self.users = users.filter { $0.id != currentUserId }
    }
    
}
