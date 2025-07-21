//
//  NetworkService.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

protocol NetworkServicable: OnboardingServiceProtocol, StreakServiceProtocol, LoginServiceProtocol, AgentServiceProtocol {}


final class NetworkService: NetworkServicable {
    
    func loginOrFetchUser(_ appleUser: AppleSignInUser) async throws -> UserData {
        try await Task.sleep(nanoseconds: 500_000_000)

        return UserData(
            id: Int.random(in: 1000...9999),
            name: appleUser.fullName ?? "Mertcan",
            email: appleUser.email ?? "unknown@mail.com",
            age: .range13_18,
            nativeLanguage: .turkish,
            targetLanguage: .english,
            languageLevel: .b1,
            languageGoals: [.soundNatural, .speaking],
            practicePurpose: [.career],
            weeklyGoal: .twoToThree,
            interests: [.art, .animals]
        )
    }

    func completeOnboarding(_ user: UserData) async throws -> UserData {
        try await Task.sleep(nanoseconds: 500_000_000)
        return user
    }
    
    func fetchUserStreak(for userId: Int) async throws -> UserStreakModel {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        try await Task.sleep(nanoseconds: 300_000_000)

        return UserStreakModel(
            completedDates: [
                calendar.date(byAdding: .day, value: -1, to: today)!,
                calendar.date(byAdding: .day, value: -2, to: today)!,
                calendar.date(byAdding: .day, value: -4, to: today)!
            ],
            longestStreak: 6,
            currentStreak: 2,
            todayProgress: 0.35
        )
    }
    
    func fetchAgents() async throws -> [Agent] {
        try await Task.sleep(nanoseconds: 200_000_000)
        return Agent.mockList
    }
}
