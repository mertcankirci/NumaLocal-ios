//
//  MainTabRoute.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

enum MainTabRoute: String, Hashable, CaseIterable {
    case home
    case chat
    case progress

    var title: String {
        switch self {
        case .home:    
            return "Home"
        case .chat:
            return "Chat"
        case .progress:
            return "Progress"
        }
    }

    var iconName: String {
        switch self {
        case .home:    
            return "house.fill"
        case .chat:    
            return "message.fill"
        case .progress:
            return "chart.bar.fill"
        }
    }
}
