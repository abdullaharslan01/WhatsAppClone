//
//  FloatingField.swift
//  whatsAppClone
//
//  Created by abdullah on 21.10.2024.
//

import SwiftUI

struct FloatingField: View {
    
    var title: String
    var placeHolder: String
    @Binding var text: String
    var isPasswordField: Bool = false
    var keyboardType: UIKeyboardType = .emailAddress
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.gray)
                .font(.system(.subheadline, design: .rounded))
                .offset(y: text.isEmpty ? 0 : -25)
            
            VStack {
                
                if isPasswordField {
                   
                    SecureField(placeHolder, text: $text)
                } else
                {
                    TextField(placeHolder, text: $text)
                        .keyboardType(keyboardType)
                        .autocorrectionDisabled()
                }
                
                Divider()
            }
            
        }
        .animation(.default, value: text.isEmpty ? 0 : -25)
        .padding()
        .padding(.top, text.isEmpty ? 0 : 18)
    }
}

