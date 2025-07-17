////
////  UserInfoViewModel.swift
////  mobvenNavigation
////
////  Created by Mertcan Kırcı on 16.07.2025.
////
//
//import Foundation
//
//final class UserInfoViewModel: ObservableObject {
//    @Published var nativeLanguage: LanguageOption? = nil
//    @Published var targetLanguage: LanguageOption? = nil
//    @Published var learningPurposes: Set<LearningPurposeOption> = []
//    @Published var learningGoals: Set<LearningGoalOption> = []
//    @Published var languageLevel: LanguageLevelOption? = nil
//    @Published var ageRange: AgeRangeOption? = nil
//    @Published var interests: Set<InterestOption> = []
//    @Published var selectedWeeklyGoal: WeeklyGoalOption? = nil
//    
//    
//    
//    func setWeeklyGoal(_ goal: WeeklyGoalOption) {
//        selectedWeeklyGoal = goal
//    }
//
//    func toggleInterest(_ interest: InterestOption) {
//        if interests.contains(interest) {
//            interests.remove(interest)
//        } else {
//            interests.insert(interest)
//        }
//    }
//
//    func setAgeRange(_ range: AgeRangeOption) {
//        ageRange = range
//    }
//    
//    func setLanguageLevel(_ level: LanguageLevelOption) {
//        self.languageLevel = level
//    }
//
//    func toggleLearningGoal(_ goal: LearningGoalOption) {
//        if learningGoals.contains(goal) {
//            learningGoals.remove(goal)
//        } else {
//            learningGoals.insert(goal)
//        }
//    }
//    
//    func toggleLearningPurpose(_ purpose: LearningPurposeOption) {
//        if learningPurposes.contains(purpose) {
//            learningPurposes.remove(purpose)
//        } else {
//            learningPurposes.insert(purpose)
//        }
//    }
//    
//    func setNativeLanguage(_ language: LanguageOption) {
//        self.nativeLanguage = language
//    }
//    
//    func deselectNativeLanguage() {
//        self.nativeLanguage = nil
//    }
//    
//    func setTargetLanguage(_ language: LanguageOption) {
//        self.targetLanguage = language
//    }
//    
//    func deselectTargetLanguage() {
//        self.targetLanguage = nil 
//    }
//}
