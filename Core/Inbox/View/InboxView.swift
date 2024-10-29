//
//  InboxView.swift
//  whatsAppClone
//
//  Created by abdullah on 17.10.2024.
//

import SwiftUI

struct InboxView: View {
    
    @StateObject private var viewModel = InboxViewModel()
    
    @State private var selectedUser: User?
    
    var body: some View {
        NavigationStack {
          
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(0 ..< 5) { _ in
                        NavigationLink {
                            ChatView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            InboxRowView()
                            
                        }
                        
                    }
                        
                }
                
                .listStyle(.plain)
                    
                Button {
                    viewModel.showNewMessage.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.darkGray))
                        .frame(width: 50, height: 50)
                        .padding()
                        .overlay {
                            Image(systemName: "plus.bubble.fill")
                                .foregroundStyle(.white)
                        }
                    
                }
                
                .fullScreenCover(isPresented: $viewModel.showNewMessage, content: {
                    NewMessageView(selectedUser: $selectedUser)
                })
                .navigationDestination(isPresented: $viewModel.showChat, destination: {
                    if let selectedUser = selectedUser {
                        ChatView(selectedUser: selectedUser)
                            .navigationBarBackButtonHidden()
                    }
                })
                .onChange(of: selectedUser, { oldValue, newValue in
                    viewModel.showChat = selectedUser != nil
                })
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("WhatsApp")
                            .foregroundStyle(.white)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .navigationBarColor(backgroundColor: Color(.darkGray))
                        
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: 24) {
                            Image(systemName: "camera")
                            Image(systemName: "magnifyingglass")
                            NavigationLink {
                                SettignsView(user: viewModel.currentUser)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Image(systemName: "ellipsis")
                            }

                        }
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
