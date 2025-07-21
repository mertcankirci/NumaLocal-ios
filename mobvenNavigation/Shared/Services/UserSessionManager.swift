//
//  UserSessionManager.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 17.07.2025.
//

import Foundation

protocol SessionManagable {
    var user: UserData? {get set}
    func setUser(_ user: UserData)
    func markOnboardingCompleted()
    func clearSession()
}

final class UserSessionManager: SessionManagable, ObservableObject {
    @Published var user: UserData? = nil
    private let persistenceService: PersistenceServicable

    init(persistenceService: PersistenceServicable = PersistenceService()) {
        self.persistenceService = persistenceService
    }

    func setUser(_ user: UserData) {
        DispatchQueue.main.async {
            self.user = user
        }
    }

    func markOnboardingCompleted() {
        persistenceService.setOnboardingCompleted(true)
    }

    func clearSession() {
        DispatchQueue.main.async {
            self.user = nil
        }
    }

    var isOnboardingCompleted: Bool {
        persistenceService.isOnboardingCompleted()
    }
}
