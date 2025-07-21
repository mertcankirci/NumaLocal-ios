//
//  LearningPurposeOption.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

enum LearningPurposeOption: String, CaseIterable, SelectableOption {
    case travel, dailyTalk, career, grammar

    var id: String { rawValue }

    var title: String {
        switch self {
        case .travel: return "Travelling"
        case .dailyTalk: return "Daily Talk"
        case .career: return "Career Growth"
        case .grammar: return "Better Grammar"
        }
    }

    var icon: String? {
        switch self {
        case .travel: return "airplane"
        case .dailyTalk: return "calendar"
        case .career: return "briefcase"
        case .grammar: return "teacher"
        }
    }
}

