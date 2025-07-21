//
//  LearningGoalOption.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

enum LearningGoalOption: String, CaseIterable, SelectableOption {
    case speaking
    case listening
    case grammar
    case soundNatural
    case vocabulary
    case realLifeTalks
    

    var id: String { rawValue }

    var title: String {
        switch self {
        case .speaking: return "Speak better"
        case .listening: return "Understand better"
        case .grammar: return "Improve grammar"
        case .soundNatural: return "Sound natural"
        case .vocabulary: return "Expand vocabulary"
        case .realLifeTalks: return "Handle real life talks"
        }
    }

    var icon: String? {
        switch self {
        case .speaking: return "messages"
        case .listening: return "message-question"
        case .grammar: return "book"
        case .soundNatural: return "sound"
        case .vocabulary: return "note"
        case .realLifeTalks: return "global"
        }
    }
}

