//
//  CircularProfileImageView.swift
//  whatsAppClone
//
//  Created by abdullah on 18.10.2024.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxsmall
    case xsmall
    case small
    case medium
    case large
    case xlarge
    case xxlarge

    var dimension: CGFloat {
        switch self {
        case .xxsmall:
            28
        case .xsmall:
            32
        case .small:
            40
        case .medium:
            56
        case .large:
            64
        case .xlarge:
            80
        case .xxlarge:
            120
        }
    }
}

struct CircularProfileImageView: View {

    private let size: ProfileImageSize

    var user: User?

    init(size: ProfileImageSize, user: User?) {
        self.size = size
        self.user = user
    }

    var body: some View {

        if let profileImageUrl = user?.profileImageUrl {
            KFImage(URL(string: profileImageUrl))
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .scaledToFill()
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .foregroundStyle(Color(.systemGray4))
                .frame(width: size.dimension, height: size.dimension)
                .scaledToFill()
                .clipShape(Circle())
            
        }

    }
}

#Preview {
    CircularProfileImageView(size: .medium, user: User.MOCK_USER)
}
