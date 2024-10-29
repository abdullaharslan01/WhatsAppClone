//
//  RootView.swift
//  whatsAppClone
//
//  Created by abdullah on 17.10.2024.
//

import FirebaseAuth
import SwiftUI

struct RootView: View {


    @StateObject private var viewModel = RootViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabbarView()
            } else {
                WelcomeView()
            }
        }
    }
}

#Preview {
    RootView()
}
