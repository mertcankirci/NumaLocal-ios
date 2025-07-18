//
//  ContentView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 15.07.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var flowNav: AppFlowNavigator
    @EnvironmentObject private var sessionManager: UserSessionManager
    @ObservedObject var loginVM: LoginViewModel
    @ObservedObject var welcomeVM: WelcomeViewModel
    @ObservedObject var onboardingVM: OnboardingViewModel
    @ObservedObject var streakVM: StreakViewModel

    var body: some View {
        Group {
            switch flowNav.current {
            case .welcome:
                WelcomeScreen(loginVM: loginVM, welcomeVM: welcomeVM)
            case .onboarding:
                OnboardingScreen(onboardingVM: onboardingVM)
            case .main:
                MainFlowView(streakVM: streakVM)
            }
        }
        .animation(.easeInOut, value: flowNav.current)
        .onAppear {
            handleAppState()
        }
    }
    
    private func handleAppState() {
        if let _ = sessionManager.user {
            if sessionManager.isOnboardingCompleted {
                flowNav.goToMain()
            } else {
                flowNav.goToOnboarding()
            }
        }
    }
}

#Preview {
    let appleSignInService = AppleSignInManager()
    let networkService = NetworkService()
    let persistenceService = PersistenceService()
    let appFlowNavigator: AppFlowNavigator = AppFlowNavigator()
    let onboardingVM = OnboardingViewModel(networkService: NetworkService(), sessionManager: UserSessionManager(persistenceService: persistenceService), persistence: persistenceService, flowNav: AppFlowNavigator())
    
    ContentView(loginVM: LoginViewModel(appleSignInService: appleSignInService, networkService: networkService, sessionManager: UserSessionManager(persistenceService: persistenceService), flowNav: appFlowNavigator), welcomeVM: WelcomeViewModel(), onboardingVM: onboardingVM, streakVM: StreakViewModel(networkService: networkService))
        .environmentObject(AppFlowNavigator())
        .environmentObject(UserSessionManager(persistenceService: PersistenceService()))
}
