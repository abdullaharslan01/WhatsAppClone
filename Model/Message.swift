//
//  Message.swift
//  whatsAppClone
//
//  Created by abdullah on 19.10.2024.
//

import Foundation
import Firebase
import FirebaseFirestore


struct Message: Identifiable, Hashable, Codable {
    var id = UUID().uuidString

    let fromId: String
    let toId: String
    let messageText: String
    // let timeStamp: Timestamp

    let isImage: Bool
    let isAudio: Bool
    let isVideo: Bool

  
    let user: User?

}

struct MessageGroup: Identifiable, Hashable {
    var id = UUID().uuidString
    var messages: [Message]
    let date: Date
}

extension MessageGroup {
    static var MOCK_MESSAGE_GROUP = [MessageGroup(messages: [Message(fromId: "", toId: "", messageText: "Hello Abdullah", isImage: false, isAudio: false, isVideo: false, user: nil)], date: Date()), MessageGroup(messages: [Message(fromId: "", toId: "", messageText: "Hello Abdullah", isImage: false, isAudio: false, isVideo: false, user: nil)], date: Date())]
}
