//
//  ChatBubble.swift
//  whatsAppClone
//
//  Created by abdullah on 19.10.2024.
//

import SwiftUI

struct ChatBubble: Shape {

    let isFromCurrentUser: Bool

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight, .topLeft, isFromCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }

}
