//
//  User.swift
//  whatsAppClone
//
//  Created by abdullah on 18.10.2024.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    let fullname: String
    let email: String
    let phoneNumber: String
    var profileImageUrl: String?
    
    enum CodingKeys: CodingKey {
        case id
        case fullname
        case email
        case phoneNumber
        case profileImageUrl 
    }
    
    
   
}


extension User {
    static let MOCK_USER = User(fullname: "Abdullah Arslan", email: "abdullaharslan1473@gmail.com", phoneNumber: "5368155351", profileImageUrl: nil)
}
