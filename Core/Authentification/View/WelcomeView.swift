//
//  WelcomeView.swift
//  whatsAppClone
//
//  Created by abdullah on 21.10.2024.
//

import SwiftUI

struct WelcomeView: View {
    
    @StateObject private var viewModel: WelcomeViewModel = .init()
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                    }.font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.darkGray))
                        .padding()
                    
                    Image("welcome_image")
                        .resizable()
                        .frame(width: proxy.size.width - 80, height: proxy.size.width - 60)
                    
                    TitleView()
                    
                    LanguageButtonView()
                    
                    Spacer()
              
                        AgreeButton(width: proxy.size.width - 80)
                        .environmentObject(viewModel)
                    
                    
                }.padding(.horizontal)
                    .padding(.bottom)
                    .fullScreenCover(isPresented: $viewModel.showLoginView) {
                        LoginView()
                    }
            }
        }
    }
}

#Preview {
    WelcomeView()
}

struct AgreeButton: View {
    
    let width: CGFloat
    
    @EnvironmentObject var viewModel:WelcomeViewModel
    
    
    var body: some View {
        
        Button {
            
            viewModel.showLoginView.toggle()
            
        } label: {
            
            Text("Agree and continue")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: width, height: 44)
                .background(Color(.darkGray))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to WhatsApp")
                .font(.title2)
                .fontWeight(.semibold)
            Text("Read our")
                .foregroundStyle(.gray) +
                Text(" Privacty Policy").foregroundStyle(.blue) +
                Text(". Tap agree and continue to accept the")
                .foregroundStyle(.gray) + Text(" Terms of service")
                .foregroundStyle(.blue)
        }.font(.subheadline)
            .padding(.horizontal)
            .padding(.top, 24)
    }
}

struct LanguageButtonView: View {
    var body: some View {
        Capsule()
            .fill(Color(.systemGray5))
            .frame(width: 160, height: 40)
            .overlay {
                HStack {
                    Image(systemName: "network")
                    Spacer()
                    Text("English")
                    Spacer()
                    Image(systemName: "chevron.down")
                }.padding(.horizontal)
                    .foregroundStyle(Color(.darkGray))
                    .font(.subheadline)
            }.padding(.top, 16)
    }
}
