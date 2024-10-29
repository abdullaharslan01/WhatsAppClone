//
//  NewMessageView.swift
//  whatsAppClone
//
//  Created by abdullah on 18.10.2024.
//

import SwiftUI

struct NewMessageView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel = NewMessageViewModel()
    @Binding var selectedUser: User?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    ContactView(contactViewInfo: .init(imageName: "person.2.circle.fill", description: "New group"))
                    
                    ContactView(contactViewInfo: .init(imageName: "person.circle.fill", description: "New contact"))
 
                    ContactView(contactViewInfo: .init(imageName: "shared.with.you.circle.fill", description: "New community"))
                    
                }
                .padding(.top)
                
                Text("Contacts on whatsApp")
                    .foregroundStyle(Color(.darkGray))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                if  viewModel.loading {
                    WCProgreesView()
                } else {
                    
                    ForEach(viewModel.users) { user in
                        HStack {
                            CircularProfileImageView(size: .small, user: user)
                            VStack(alignment: .leading) {
                                Text(user.fullname)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                Text("Hi there I am using WhatsApp")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                        }
                        .padding(.bottom, 20)
                        .onTapGesture {
                            selectedUser = user
                            dismiss()
                        }
                    }
                }
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 16) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Select contact")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("\(viewModel.users.count) contacts")
                                .font(.caption)
                        }

                    }.foregroundStyle(.white)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 24) {
                        Image(systemName: "magnifyingglass")
                        Image(systemName: "ellipsis")
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    
                }
            }
        }
    }
}

#Preview {
    NewMessageView(selectedUser: .constant(User.MOCK_USER))
}

