//
//  OnboardingViewModel.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation



final class OnboardingViewModel: ObservableObject {
    @Published var step: OnboardingStep = .nativeLanguageSelection
    @Published var nativeLanguage: LanguageOption? = nil
    @Published var targetLanguage: LanguageOption? = nil
    @Published var learningPurposes: Set<LearningPurposeOption> = []
    @Published var learningGoals: Set<LearningGoalOption> = []
    @Published var languageLevel: LanguageLevelOption? = nil
    @Published var ageRange: AgeRangeOption? = nil
    @Published var interests: Set<InterestOption> = []
    @Published var selectedWeeklyGoal: WeeklyGoalOption? = nil
    
    private let networkService: NetworkServicable
    private let sessionManager: SessionManagable
    private let persistence: PersistenceServicable
    private let flowNav: AppFlowNavigating
    
    init(
        networkService: NetworkServicable,
        sessionManager: UserSessionManager,
        persistence: PersistenceServicable,
        flowNav: AppFlowNavigator
    ) {
        self.networkService = networkService
        self.sessionManager = sessionManager
        self.persistence = persistence
        self.flowNav = flowNav
    }
    
    func completeOnboarding() {
        Task {
            guard let userId = sessionManager.user?.id else { return }
            let user = try buildUserData(userId: userId)
            
            let updatedUser = try await networkService.completeOnboarding(user)
            sessionManager.setUser(updatedUser)
            persistence.setOnboardingCompleted(true)
            flowNav.goToMain()
        }
    }
    
    func buildUserData(userId: Int, name: String = "", email: String = "") throws -> UserData {
        guard let ageRange,
              let nativeLanguage,
              let targetLanguage,
              let languageLevel,
              let weeklyGoal = selectedWeeklyGoal else {
            throw NetworkError.badRequest
        }

        return UserData(
            id: userId,
            name: name,
            email: email,
            age: ageRange,
            nativeLanguage: nativeLanguage,
            targetLanguage: targetLanguage,
            languageLevel: languageLevel,
            languageGoals: Array(learningGoals),
            practicePurpose: Array(learningPurposes),
            weeklyGoal: weeklyGoal,
            interests: Array(interests)
        )
    }
    
    func setWeeklyGoal(_ goal: WeeklyGoalOption) {
        selectedWeeklyGoal = goal
    }
    
    func toggleInterest(_ interest: InterestOption) {
        if interests.contains(interest) {
            interests.remove(interest)
        } else {
            interests.insert(interest)
        }
    }
    
    func setAgeRange(_ range: AgeRangeOption) {
        ageRange = range
    }
    
    func setLanguageLevel(_ level: LanguageLevelOption) {
        self.languageLevel = level
    }
    
    func toggleLearningGoal(_ goal: LearningGoalOption) {
        if learningGoals.contains(goal) {
            learningGoals.remove(goal)
        } else {
            learningGoals.insert(goal)
        }
    }
    
    func toggleLearningPurpose(_ purpose: LearningPurposeOption) {
        if learningPurposes.contains(purpose) {
            learningPurposes.remove(purpose)
        } else {
            learningPurposes.insert(purpose)
        }
    }
    
    func setNativeLanguage(_ language: LanguageOption) {
        self.nativeLanguage = language
    }
    
    func deselectNativeLanguage() {
        self.nativeLanguage = nil
    }
    
    func setTargetLanguage(_ language: LanguageOption) {
        self.targetLanguage = language
    }
    
    func deselectTargetLanguage() {
        self.targetLanguage = nil
    }
    
    func nextStep() {
        if let next = step.next {
            step = next
        }
    }
    
    func previousStep() {
        if let previous = step.previous {
            step = previous
        }
    }
    
    func isLastStep() -> Bool {
        return step.isLast
    }
    
    func isFirstStep() -> Bool {
        return step == OnboardingStep.allCases[0]
    }
}
