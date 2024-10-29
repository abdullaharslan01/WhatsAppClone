//
//  ChatView.swift
//  whatsAppClone
//
//  Created by abdullah on 19.10.2024.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    private var selectedUser: User?
    init(selectedUser:User? = nil) {
        self.selectedUser = selectedUser
    }
    
    var body: some View {
        VStack {
            ScrollView {
                
                VStack {
                    ForEach(MessageGroup.MOCK_MESSAGE_GROUP) { group in
                        
                        Section {
                            ForEach(group.messages) { message in
                                ChatMessageCell(isFromCurrentUser: Bool.random(), message: message)
                            }
                        } header: {
                            Capsule()
                                .fill(Color(.systemGray5))
                                .frame(width: 128, height: 44)
                                .overlay {
                                  
                                    Text(group.date.chatTimeStampString())
                                }
                        }
                        
                        
                        
                        
                    }
                }.padding(.top)
                
                
            }
            Spacer()
            HStack {
                
                ZStack {
                    
                    TextField("Message...", text: $viewModel.messageText)
                        .padding(.vertical, 12)
                        .padding(.leading, 44)
                        .padding(.trailing, 60)
                        .background(Color(.systemGroupedBackground))
                        .clipShape(Capsule())
                    
                    HStack {
                        Image(systemName: "face.smiling")
                        Spacer()
                        Image(systemName: "paperclip")
                        Image(systemName: "camera.fill")
                    }.padding(.horizontal)
                        .foregroundStyle(.gray)
                }
                
                Button {} label: {
                    Image(systemName: viewModel.messageText == "" ? "mic.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color(.darkGray))
                }
                
            }.padding()
        }
        .background(
            Image("background_image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
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
                    
                    CircularProfileImageView(size: .xsmall, user: selectedUser)
                    
                    Text(selectedUser?.fullname ?? "")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.white)
                
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 24) {
                    Image(systemName: "video.fill")
                    Image(systemName: "phone.fill")
                    Image(systemName: "ellipsis")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            }
        }
    }
        
}

#Preview {
    NavigationStack {
        ChatView()
    }
 
}
