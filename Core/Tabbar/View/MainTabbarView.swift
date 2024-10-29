//
//  MainTabbarView.swift
//  whatsAppClone
//
//  Created by abdullah on 17.10.2024.
//

import SwiftUI

struct MainTabbarView: View {
    @State private var selectedTab: Int = 3

    var body: some View {

        TabView(selection: $selectedTab) {
            Tab("Updates", systemImage: "dial.low", value: 0) {
                VStack {}
            }

            Tab("Calls", systemImage: "phone", value: 1) {
                VStack {}
            }
            Tab("Communities", systemImage: "person.3", value: 2) {
                VStack {}
            }

            Tab("Chats", systemImage: "bubble.fill", value: 3) {
                InboxView()
            }

           

        }
        .tint(.primary)

    }
}

#Preview {
    MainTabbarView()
}
