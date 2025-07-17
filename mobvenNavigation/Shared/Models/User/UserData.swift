//
//  UserData.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 17.07.2025.
//

import Foundation

struct UserData: Codable {
    var id: Int
    var name: String
    var email: String
    var age: AgeRangeOption
    var nativeLanguage: LanguageOption
    var targetLanguage: LanguageOption
    var languageLevel: LanguageLevelOption
    var languageGoals: [LearningGoalOption]
    var practicePurpose: [LearningPurposeOption]
    var weeklyGoal: WeeklyGoalOption
    var interests: [InterestOption]
}

