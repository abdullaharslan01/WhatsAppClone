//
//  AuthenticationModifier.swift
//  whatsAppClone
//
//  Created by abdullah on 22.10.2024.
//

import SwiftUI

struct AuthenticationModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 360, height: 44)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.vertical)
    }
}

extension View {
    func authentificationButtonModifier()-> some View {
        return modifier(AuthenticationModifier())
    }
}
