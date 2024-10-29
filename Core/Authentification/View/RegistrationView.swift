//
//  RegistrationView.swift
//  whatsAppClone
//
//  Created by abdullah on 22.10.2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                LogoImageView()
                FloatingField(title: "Email", placeHolder: "", text: $viewModel.email, keyboardType: .emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                FloatingField(title: "Full name", placeHolder: "", text: $viewModel.fullName)
                FloatingField(title: "Phone number", placeHolder: "", text: $viewModel.phoneNumber, keyboardType: .phonePad)
                FloatingField(title: "Password", placeHolder: "", text: $viewModel.password, isPasswordField: true)

                Button {
                    Task {
                        try await viewModel.createUser()
                    }
                } label: {
                    Text("Sign Up")
                        .authentificationButtonModifier()
                        .padding(.vertical)
                }

                Spacer()
                Divider()

                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundStyle(.gray)
                }.padding(.vertical)

            }
            
            if viewModel.loading {
                
                WCProgreesView()
            }
            
            
        }.toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}
