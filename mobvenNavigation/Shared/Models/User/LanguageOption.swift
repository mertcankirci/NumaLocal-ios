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
        case .turkish: return "TR"
        case .english: return "GB"
        case .german: return "DE"
        case .french: return "FR"
        case .spanish: return "ES"
        case .italian: return "IT"
        }
    }
}


