//
//  mobvenNavigationApp.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 15.07.2025.
//

import SwiftUI

@main
struct mobvenNavigationApp: App {
    @StateObject private var flowNav: AppFlowNavigator
    @StateObject private var mainNav: NavigationService<MainTabRoute>
    @StateObject private var homeNav: NavigationService<HomeRoute>
    
    @StateObject private var mainVM: MainViewModel
    @StateObject private var homeVM: HomeViewModel
    @StateObject private var loginVM: LoginViewModel
    @StateObject private var welcomeVM = WelcomeViewModel()
    @StateObject private var onboardingVM: OnboardingViewModel
    @StateObject private var sessionManager: UserSessionManager
    
    init() {
        let flowNav = AppFlowNavigator()
        let mainNav = NavigationService<MainTabRoute>()
        let homeNav = NavigationService<HomeRoute>()
        let appleSignInService = AppleSignInManager()
        let persistenceService = PersistenceService()
        let networkService = NetworkService()
        
        // For both using session manager as stateobject and dependency in onboarding vm
        let sessionManagerInstance = UserSessionManager(persistenceService: persistenceService)
        
        _flowNav = StateObject(wrappedValue: flowNav)
        _mainNav = StateObject(wrappedValue: mainNav)
        _homeNav = StateObject(wrappedValue: homeNav)
        _sessionManager = StateObject(wrappedValue: sessionManagerInstance)
        
        _mainVM = StateObject(wrappedValue: MainViewModel(navigationService: mainNav))
        _homeVM = StateObject(wrappedValue: HomeViewModel(navigationService: homeNav))
        
        _loginVM = StateObject(wrappedValue: LoginViewModel(
            appleSignInService: appleSignInService,
            networkService: networkService,
            sessionManager: sessionManagerInstance,
            flowNav: flowNav
        ))
        
        _onboardingVM = StateObject(wrappedValue: OnboardingViewModel(
            networkService: networkService,
            sessionManager: sessionManagerInstance,
            persistence: persistenceService,
            flowNav: flowNav
        ))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(flowNav)
                .environmentObject(mainNav)
                .environmentObject(mainVM)
                .environmentObject(welcomeVM)
                .environmentObject(homeNav)
                .environmentObject(homeVM)
                .environmentObject(loginVM)
                .environmentObject(onboardingVM)
                .environmentObject(sessionManager)
        }
    }
}

