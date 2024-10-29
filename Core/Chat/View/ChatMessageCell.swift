//
//  ChatMessageCell.swift
//  whatsAppClone
//
//  Created by abdullah on 19.10.2024.
//

import SwiftUI

struct ChatMessageCell: View {
    
    let isFromCurrentUser:Bool
    
    let message: Message
    
    var body: some View {
        
        if isFromCurrentUser {
            
            
            
            VStack(alignment: .leading, spacing: -15) {
                Text(message.messageText)
                
                HStack {
                    Text(message.messageText)
                        .foregroundStyle(.clear)
                    Text("10:00")
                        .foregroundStyle(.gray)
                        .font(.footnote)
                }
            }.font(.subheadline)
                .padding(12)
                .background(Color("Peach"))
                .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
        }
        else {
            HStack(spacing:8) {
                
                CircularProfileImageView(size:.xxsmall, user: User.MOCK_USER)
                
                VStack(alignment: .leading, spacing: -15) {
                    Text(message.messageText)
                    
                    HStack {
                        Text(message.messageText)
                            .foregroundStyle(.clear)
                        Text("10:00")
                            .foregroundStyle(.gray)
                            .font(.footnote)
                    }
                }.font(.subheadline)
                    .padding(12)
                    .background(Color("Peach"))
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }.padding(.horizontal)
        }
    }
}

#Preview {
    ChatMessageCell(isFromCurrentUser: false, message: MessageGroup.MOCK_MESSAGE_GROUP.first!.messages.first! )
}
