//
//  LoginViewModel.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    private let appleSignInService: AppleSignInManagable
    private let networkService: NetworkServicable
    private let sessionManager: UserSessionManager
    private let flowNav: AppFlowNavigator

    @Published var isLoading = false

    init(
        appleSignInService: AppleSignInManagable,
        networkService: NetworkServicable,
        sessionManager: UserSessionManager,
        flowNav: AppFlowNavigator
    ) {
        self.appleSignInService = appleSignInService
        self.networkService = networkService
        self.sessionManager = sessionManager
        self.flowNav = flowNav
    }

    func signIn() async throws {
        isLoading = true
        defer { isLoading = false }

        do {
            let appleUser = try await appleSignInService.startSignInWithAppleFlow()
            let user = try await networkService.loginOrFetchUser(appleUser)

            sessionManager.setUser(user)

            if sessionManager.isOnboardingCompleted {
                flowNav.goToMain()
            } else {
                flowNav.goToOnboarding()
            }
        } catch {
            throw error
        }
    }
}

