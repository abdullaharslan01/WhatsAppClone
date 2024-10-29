//
//  LogoImageView.swift
//  whatsAppClone
//
//  Created by abdullah on 22.10.2024.
//

import SwiftUI

struct LogoImageView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .padding()
    }
}
#Preview {
    LogoImageView()
}
