//
//  SettignsOption.swift
//  whatsAppClone
//
//  Created by abdullah on 21.10.2024.
//

import Foundation

enum SettignsOption: Int, CaseIterable, Identifiable {
    var id: Int {
        return self.rawValue
    }

    case account
    case privacy
    case avatar
    case chats
    case notifications
    case storageAndData
    case appLanguage
    case help
    case inviteAFriend
    case logout
}

extension SettignsOption {
    var title: String {
        switch self {
        case .account: return "Account"
        case .privacy: return "Privacy"
        case .avatar: return "Avatar"
        case .chats: return "Chats"
        case .notifications: return "Notifications"
        case .storageAndData: return "Storage and Data"
        case .appLanguage: return "App Language"
        case .help: return "Help"
        case .inviteAFriend: return "Invite a Friend"
        case .logout: return "Logout"
        }
    }
    
    var subtitle: String? {
        switch self {
        case .account: return "Manage your account settings"
        case .privacy: return "Control your privacy options"
        case .avatar: return "Create and manage your avatar"
        case .chats: return "Chat settings"
        case .notifications: return "Customize notifications"
        case .storageAndData: return "Manage storage and data usage"
        case .appLanguage: return "Change app language"
        case .help: return "Get help and support"
        default:
            return nil
        }
    }
    
    var imageName: String {
        switch self {
        case .account: return "key.fill"
        case .privacy: return "lock.fill"
        case .avatar: return "face.smiling.inverse"
        case .chats: return "text.bubble.fill"
        case .notifications: return "bell.fill"
        case .storageAndData: return "circle.dotted.circle.fill"
        case .appLanguage: return "map.circle.fill"
        case .help: return "questionmark.circle"
        case .inviteAFriend: return "person.2.fill"
        case .logout: return "rectangle.portrait.and.arrow.right.fill"
        }
    }
}
