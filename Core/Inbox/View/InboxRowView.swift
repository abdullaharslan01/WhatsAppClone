//
//  InboxRowView.swift
//  whatsAppClone
//
//  Created by abdullah on 17.10.2024.
//

import SwiftUI

struct InboxRowView: View {
    
    var body: some View {
        HStack(spacing: 12) {
            CircularProfileImageView(size: .medium, user: User.MOCK_USER)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Elizabeth Arslan")
                    .fontWeight(.semibold)
                
                Text("Hello")
                    .foregroundStyle(.gray)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    
            }
            .font(.subheadline)
            
            Spacer()
            
            HStack {
                Text("Yesterday")
               // Image(systemName: "chevron.right")
            }.font(.footnote)
                .foregroundStyle(.gray)
            
        }
            .frame(height: 72)
          
    }
}

#Preview {
    InboxRowView()
}
