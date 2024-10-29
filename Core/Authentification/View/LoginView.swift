//
//  LoginView.swift
//  whatsAppClone
//
//  Created by abdullah on 21.10.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    LogoImageView()
                    
                    FloatingField(title: "Email", placeHolder: "", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    FloatingField(title: "Password", placeHolder: "", text: $viewModel.password, isPasswordField: true)
                    
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top)
                        .padding(.trailing, 28)
                    
                    Button {
                        Task {
                            try? await viewModel.loginWithEmailAndPassword()
                        }
                    } label: {
                        Text("Login")
                            .authentificationButtonModifier()
                    }
                    
                    Spacer()
                    Divider()
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Don't have an account?")
                            Text("Sign Up")
                                .fontWeight(.semibold)
                        }
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .padding(.vertical)
                    }
                }
                
                if viewModel.loading {
                    
                    WCProgreesView()
                }
                
            }
        }
    }
    
}

#Preview {
    LoginView()
}
