//
//  LoginViewModel.swift
//  whatsAppClone
//
//  Created by abdullah on 21.10.2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loading:Bool = false
    
    @MainActor
    func loginWithEmailAndPassword() async throws{
        loading.toggle()
        try await AuthService.shared.login(email: email, password: password)
        loading.toggle()
    }
    
}
