//
//  Date.swift
//  whatsAppClone
//
//  Created by abdullah on 19.10.2024.
//

import Foundation


extension Date {
    
    
    
    private var dayFormatter:DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "MM/dd/yy"
        return formatter
    }
    
    
    func chatTimeStampString() -> String {
        let current = Calendar.current
        
        if current.isDateInToday(self) {
            return "Today"
        } else if current.isDateInYesterday(self)  {
            return "Yesterday"
        } else {
            return dayFormatter.string(from: self)
        }
    }
}
