//
//  SettignsRow.swift
//  whatsAppClone
//
//  Created by abdullah on 24.10.2024.
//

import SwiftUI

struct SettignsRow: View {
    
    let option:SettignsOption
    
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: option.imageName)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundStyle(.gray)

            VStack(alignment: .leading) {
                Text(option.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)

                if let subtitle = option.subtitle {
                    Text(subtitle)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }

            }

            Spacer()
        }
    }
}

#Preview {
    SettignsRow(option: .account)
}
