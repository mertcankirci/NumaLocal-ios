//
//  OnboardingModel.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 17.07.2025.
//

import Foundation

enum OnboardingStep: Int, CaseIterable {
    case nativeLanguageSelection
    case targetLanguageSelection
    case learningPurposeSelection
    case learningGoalSelection
    case currentLanguageLevel
    case ageInput
    case interestSelection
    case speakingFrequencyGoal
    
    var title: String {
        switch self {
        case .nativeLanguageSelection:
            return "What is your native language?"
        case .targetLanguageSelection:
            return "Which language would you like to practice or learn?"
        case .learningPurposeSelection:
            return "Why do you want to learn a new language?"
        case .learningGoalSelection:
            return "What do you want to achieve by learning a new language?"
        case .currentLanguageLevel:
            return "What is your level of English?"
        case .ageInput:
            return "How old are you?"
        case .interestSelection:
            return "What topics are you interested in?"
        case .speakingFrequencyGoal:
            return "Set your weekly goal for speaking practice"
        }
    }
    
    var next: OnboardingStep? {
        let all = Self.allCases
        guard let index = all.firstIndex(of: self), index + 1 < all.count else { return nil }
        return all[index + 1]
    }

    var previous: OnboardingStep? {
        let all = Self.allCases
        guard let index = all.firstIndex(of: self), index > 0 else { return nil }
        return all[index - 1]
    }

    var isLast: Bool {
        return next == nil
    }
    
    var isFirst: Bool {
        return previous == nil
    }

    var isMultipleSelection: Bool {
        switch self {
        case .learningPurposeSelection,
             .learningGoalSelection,
             .interestSelection:
            return true
        default:
            return false
        }
    }
}
