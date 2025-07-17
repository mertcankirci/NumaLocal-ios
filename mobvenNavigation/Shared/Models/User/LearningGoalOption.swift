//
//  LearningGoalOption.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

enum LearningGoalOption: String, CaseIterable, SelectableOption {
    case speaking
    case vocabulary
    case fluency
    case comprehension

    var id: String { rawValue }

    var title: String {
        switch self {
        case .speaking: return "Speaking Confidence"
        case .vocabulary: return "Expand Vocabulary"
        case .fluency: return "Fluency & Flow"
        case .comprehension: return "Better Comprehension"
        }
    }

    var icon: String? {
        switch self {
        case .speaking: return "mic"
        case .vocabulary: return "text.book.closed"
        case .fluency: return "speedometer"
        case .comprehension: return "brain.head.profile"
        }
    }
}

