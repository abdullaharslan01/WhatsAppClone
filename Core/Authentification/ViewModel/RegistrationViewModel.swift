//
//  RegistrationViewModel.swift
//  whatsAppClone
//
//  Created by abdullah on 22.10.2024.
//

import Foundation


final class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var fullName: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    
    @Published var loading:Bool = false
    
    
    func createUser() async throws {
        loading.toggle()
        try await AuthService.shared.createUser(email: email, password: password, fullName: fullName, phoneNumber: phoneNumber)
        loading.toggle()
    }
    
    
}
