//
//  SettignsViewModel.swift
//  whatsAppClone
//
//  Created by abdullah on 21.10.2024.
//

import SwiftUI

final class SettignsViewModel: ObservableObject {
    @Published var tabbarVisibility:Visibility = .hidden
    
    init() {
        Task {
            try await fetchCurrentUser()
        }
        
    }
    
    func logout(){
        AuthService.shared.logout()
    }
    
    func fetchCurrentUser()async throws{
        try await UserService.shared.fetchCurrentUsert()
    }
}
