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

    var body: some View {
        Group {
            switch flowNav.current {
            case .welcome:
                WelcomeScreen()
            case .onboarding:
                OnboardingScreen()
            case .main:
                MainFlowView()
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
    ContentView()
        .environmentObject(AppFlowNavigator())
        .environmentObject(UserSessionManager(persistenceService: PersistenceService()))
}
