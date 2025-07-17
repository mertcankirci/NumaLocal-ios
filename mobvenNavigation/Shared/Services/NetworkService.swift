//
//  NetworkService.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

protocol NetworkServicable {
    func loginOrFetchUser(_ appleUser: AppleSignInUser) async throws -> UserData
    func completeOnboarding(_ user: UserData) async throws -> UserData
}

final class NetworkService: NetworkServicable {
    
    private var mockUserStore: [String: UserData] = [:] // userId'ye göre saklanan mock kullanıcılar
    
    func loginOrFetchUser(_ appleUser: AppleSignInUser) async throws -> UserData {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 500_000_000)
        
        if let existingUser = mockUserStore[appleUser.userId] {
            return existingUser
        } else {
            let newUser = UserData(
                id: Int.random(in: 1000...9999),
                name: appleUser.fullName ?? "Guest",
                email: appleUser.email ?? "unknown@mail.com",
                age: .range13_18,
                nativeLanguage: .turkish,
                targetLanguage: .english,
                languageLevel: .b1,
                languageGoals: [.comprehension, .fluency, .speaking],
                practicePurpose: [.career, .dailyTalk],
                weeklyGoal: .twoToThree,
                interests: [.art, .animals, .culture]
            )
            mockUserStore[appleUser.userId] = newUser
            return newUser
        }
    }
    
    func completeOnboarding(_ user: UserData) async throws -> UserData {
        try await Task.sleep(nanoseconds: 500_000_000)
        
        mockUserStore[String(user.id)] = user
        return user
    }
}

