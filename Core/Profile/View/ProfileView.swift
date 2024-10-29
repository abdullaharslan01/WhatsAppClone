//
//  ProfileView.swift
//  whatsAppClone
//
//  Created by abdullah on 21.10.2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel = ProfileViewModel()
    
    private var user:User?
    
    
    init(user:User? = nil) {
        self.user = user
    }
    
    
    var body: some View {
        VStack {
            
            Button {
                viewModel.showPhotoPicker.toggle()
            } label: {
                ZStack(alignment: .bottomTrailing) {
                    
                    
                    ZStack {
                        if let profileImage = viewModel.profileImage {
                            profileImage
                                .resizable()
                                .frame(width: 120, height: 120)
                                .scaledToFit()
                                .clipShape(Circle())
                        } else {
                            CircularProfileImageView(size: .xxlarge, user: user)

                        }
                    }
                    
                                
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color(.darkGray))
                        .overlay {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundStyle(.white)
                        }
                                
                }.padding(.vertical)
            }
            
            VStack(spacing: 32) {
                OptionView(optionViewInput: .init(imageName: "person.fill", title: "Name", subtitle: user?.fullname ?? "None", isEditable: true, secondSubtitle: "This is not your username or pin. This name will be visible on WhatsApp"))
                OptionView(optionViewInput: .init(imageName: "exclamationmark.circle", title: "About", subtitle: "Hey there! I am using WhatsApp.", isEditable: true))
                OptionView(optionViewInput: .init(imageName: "phone.fill", title: "Phone", subtitle: user?.phoneNumber ?? "", isEditable: false))
                
            }.padding([.leading, .trailing])
                
            Spacer()
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                        
                    Button {
                        viewModel.tabbarVisibility = .visible
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                    }
                        
                    Text("Profile")
                }.font(.title3)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
            }
        }
        .toolbarVisibility(viewModel.tabbarVisibility, for: .tabBar)
        .photosPicker(isPresented: $viewModel.showPhotoPicker, selection: $viewModel.selectedImage)
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }

}
