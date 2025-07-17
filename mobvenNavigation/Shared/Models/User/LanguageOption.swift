//
//  LanguageOption.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

enum LanguageOption: String, CaseIterable, SelectableOption {
    case turkish = "Turkish"
    case english = "English"
    case german = "German"
    case french = "French"
    case spanish = "Spanish"
    case italian = "Italian"

    var id: String { rawValue }

    var title: String { rawValue }

    var icon: String? {
        switch self {
        case .turkish: return "🇹🇷"
        case .english: return "🇬🇧"
        case .german: return "🇩🇪"
        case .french: return "🇫🇷"
        case .spanish: return "🇪🇸"
        case .italian: return "🇮🇹"
        }
    }
}


