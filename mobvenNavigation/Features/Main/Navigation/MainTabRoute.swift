//
//  MainTabRoute.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

enum MainTabRoute: String, Hashable, CaseIterable {
    case home
    case progress
    case profile

    var title: String {
        switch self {
        case .home:    
            return "Home"
        case .progress:
            return "Progress"
        case .profile:
            return "Profile"
        }
    }

    var iconName: String {
        switch self {
        case .home:    
            return "house.fill"

        case .progress:
            return "chart.bar.fill"
            
        case .profile:
            return "person.crop.circle"
        }
    }
}
