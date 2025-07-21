//
//  LanguageLevelOption.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

enum LanguageLevelOption: String, CaseIterable, SelectableOption {
    case a1, a2, b1, b2, c1, c2

    var id: String { rawValue }

    var levelCode: String {
        rawValue.uppercased()
    }

    var title: String {
        switch self {
        case .a1: return "I know basic words and simple phrases"
        case .a2: return "I can carry on basic conversations"
        case .b1: return "I can talk on everyday topics"
        case .b2: return "I can discuss various topics with ease"
        case .c1: return "I speak confidently in complex situations"
        case .c2: return "I speak like a native in all contexts"
        }
    }

    var icon: String? {
        nil
    }
}

