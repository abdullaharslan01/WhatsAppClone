//
//  NavigationBarColorModifier.swift
//  whatsAppClone
//
//  Created by abdullah on 17.10.2024.
//

import SwiftUI

struct NavigationBarColorModifier: ViewModifier {
    
    var backgroundColor: Color
    
    init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = UIColor(backgroundColor)
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
    }
    
}


extension View {
    func navigationBarColor(backgroundColor: Color) -> some View {
        return modifier(NavigationBarColorModifier(backgroundColor: backgroundColor))
    }
}
