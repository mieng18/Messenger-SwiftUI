//
//  SettingsOptionsViewModel.swift
//  Messenger-SwiftUI
//
//  Created by mai nguyen on 7/15/23.
//

import Foundation
import SwiftUI

enum SettingsOptionsViewModel: Int,CaseIterable,Identifiable {
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notifications
    
    var title: String {
        switch self {
        case .darkMode:
            return "Dark mode"
        case .activeStatus:
            return "Active Status"
        case .accessibility:
            return "Accessibility"
        case .privacy:
            return "Privacy and Safety"
        case .notifications:
            return "Notifications"
        }
    }
    
    var imageName: String {
        switch self {
        case .darkMode:
            return "moon.circle.fill"
        case .activeStatus:
            return "message.badge.circle.fill"
        case .accessibility:
            return "person.circle.fill"
        case .privacy:
            return "lock.circle.fill"
        case .notifications:
            return "bell.circle.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
            
        case .darkMode:
            return Color.gray.opacity(0.9)
        case .activeStatus:
            return Color(.systemGreen)
        case .accessibility:
            return Color.gray.opacity(0.9)

        case .privacy:
            return Color(.systemBlue)

        case .notifications:
            return Color(.yellow)
        }
    }
    
    var id: Int {return self.rawValue}
}

