//
//  InboxViewModel.swift
//  whatsAppClone
//
//  Created by abdullah on 18.10.2024.
//

import Foundation
import Combine

class InboxViewModel: ObservableObject {
    
    @Published var showNewMessage:Bool = false
    @Published var currentUser:User?
    @Published var showChat:Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscription()
    }
    
    private func setupSubscription(){
        UserService.shared.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }.store(in: &cancellables)
    }
    
}
