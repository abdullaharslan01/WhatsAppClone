//
//  ChatViewModel.swift
//  whatsAppClone
//
//  Created by abdullah on 19.10.2024.
//

import SwiftUI

final class ChatViewModel: ObservableObject {
    @Published var messageText: String = ""
    
    @Published var tabbarVisibility: Visibility = .hidden
    
    
}
