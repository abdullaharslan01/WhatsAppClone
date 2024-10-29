//
//  ContactView.swift
//  whatsAppClone
//
//  Created by abdullah on 18.10.2024.
//

import SwiftUI
struct ContactViewInfo {
    let imageName: String
    let description: String
}


struct ContactView: View {
    
    private var  contactViewInfo:ContactViewInfo
    
    init(contactViewInfo: ContactViewInfo) {
        self.contactViewInfo = contactViewInfo
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "\(contactViewInfo.imageName)")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(.gray)
            
            Text("\(contactViewInfo.description)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}
