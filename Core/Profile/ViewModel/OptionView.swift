//
//  OptionView.swift
//  whatsAppClone
//
//  Created by abdullah on 21.10.2024.
//

import SwiftUI


struct OptionViewInput {
    var imageName: String
    var title: String
    var subtitle: String
    var isEditable: Bool
    var secondSubtitle:String?
}

struct OptionView: View {
    
    var optionViewInput: OptionViewInput
    
    var body: some View {
        HStack(alignment: optionViewInput.secondSubtitle != nil ? .top : .center, spacing: 24 ) {
            Image(systemName:optionViewInput.imageName)
                .resizable()
                .frame(width: 16, height: 16)
                .scaledToFill()
                .foregroundStyle(.gray)
                .padding(.top, optionViewInput.secondSubtitle != nil ? 12 : 0)
            VStack(alignment: .leading) {
                Text("\(optionViewInput.title)")
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                Text(optionViewInput.subtitle)
                
                    .font(.footnote)
                
                if let secondSubtitle = optionViewInput.secondSubtitle  {
                    Text(secondSubtitle)
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .padding(.top, 1)
                }
                
            }
            
            Spacer()
            
            if optionViewInput.isEditable {
                
                Image(systemName: "pencil")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .scaledToFill()
                    .foregroundStyle(.gray)
            }
        }
    }
}
