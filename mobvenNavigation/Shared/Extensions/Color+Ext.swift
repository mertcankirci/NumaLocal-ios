//
//  Color+Palette.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 21.07.2025.
//

import SwiftUI

// TODO: - Add AppThemeManager
// Setup a centralized ThemeManager to support runtime theme switching (e.g. light/dark/custom themes)
// Use AppColors as tokens, and drive them from Theme object instead of static enums directly via structs.


extension Color {
    
    // MARK: - Blue
    static let blue1 = Color("blue-100")
    static let blue2 = Color("blue-200")
    static let blue3 = Color("blue-300")
    static let blue4 = Color("blue-400")
    static let blue5 = Color("blue-500")
    static let blue6 = Color("blue-600")
    static let blue7 = Color("blue-700")
    static let blue8 = Color("blue-800")
    static let blue9 = Color("blue-900")
    
    // MARK: - Natural (Gray)
    static let natural1 = Color("natural-100")
    static let natural2 = Color("natural-200")
    static let natural3 = Color("natural-300")
    static let natural4 = Color("natural-400")
    static let natural5 = Color("natural-500")
    static let natural6 = Color("natural-600")
    static let natural7 = Color("natural-700")
    static let natural8 = Color("natural-800")
    static let natural9 = Color("natural-900")
    
    // MARK: - Custom
    static let background = Color("color-bg")
}
