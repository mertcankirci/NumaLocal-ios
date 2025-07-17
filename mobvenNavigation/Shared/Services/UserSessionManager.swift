//
//  UserSessionManager.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 17.07.2025.
//

import Foundation

final class UserSessionManager: ObservableObject {
    @Published var user: UserData? = nil
    private let persistenceService: PersistenceServicable

    init(persistenceService: PersistenceServicable = PersistenceService()) {
        self.persistenceService = persistenceService
    }

    func setUser(_ user: UserData) {
        self.user = user
    }

    func markOnboardingCompleted() {
        persistenceService.setOnboardingCompleted(true)
    }

    func clearSession() {
        self.user = nil
    }

    var isOnboardingCompleted: Bool {
        persistenceService.isOnboardingCompleted()
    }
}


