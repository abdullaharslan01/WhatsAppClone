//
//  SettignsView.swift
//  whatsAppClone
//
//  Created by abdullah on 21.10.2024.
//

import SwiftUI

struct SettignsView: View {
    
    @StateObject private var viewModel = SettignsViewModel()
    @Environment(\.dismiss) private var dismiss
    
     var user:User?
    
    init(user:User? = nil) {
        self.user = user
    }
    
    
    var body: some View {
        ScrollView {
            
            VStack {
                NavigationLink {
                    ProfileView(user: user)
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 12) {
                        CircularProfileImageView(size: .large, user: user)
                        VStack(alignment: .leading) {
                            Text(user?.fullname ?? "")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                            
                            Text("Hey there! I am using WhatsApp")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }.padding(.horizontal)
                        .padding(.top)
                }
                
                Divider()
                    .padding(.vertical)
                VStack(spacing: 32) {
                    ForEach(SettignsOption.allCases) { option in
                        
                        Button {
                            if option == .logout {
                                viewModel.logout()
                            }
                            
                        } label: {
                            SettignsRow(option: option)
                        }

                     
                    }
                }.padding(.horizontal)
                    

            }
            
        }
        .toolbarVisibility(viewModel.tabbarVisibility, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                                
                    Button {
                        viewModel.tabbarVisibility = .visible
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                    }
                                
                    Text("Settigns")
                }.font(.title3)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "magnifyingglass")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
            }
        }
    }
}




#Preview {
    SettignsView(user: User.MOCK_USER)
}
