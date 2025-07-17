//
//  PersistenceService.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 17.07.2025.
//

import Foundation

protocol PersistenceServicable {
    func setOnboardingCompleted(_ completed: Bool)
    func isOnboardingCompleted() -> Bool
}

final class PersistenceService: PersistenceServicable {
    private let onboardingKey = "onboarding_completed_key"

    func setOnboardingCompleted(_ completed: Bool) {
        UserDefaults.standard.set(completed, forKey: onboardingKey)
    }

    func isOnboardingCompleted() -> Bool {
        UserDefaults.standard.bool(forKey: onboardingKey)
    }
}
