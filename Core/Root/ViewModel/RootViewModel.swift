//
//  RootViewModel.swift
//  whatsAppClone
//
//  Created by abdullah on 24.10.2024.
//

import Foundation
import FirebaseAuth
import Combine



class RootViewModel: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    
    init(){
        setUpSubscribers()
    }
    
    private func setUpSubscribers(){
        AuthService.shared.$userSession.sink {[weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
    
    
}
