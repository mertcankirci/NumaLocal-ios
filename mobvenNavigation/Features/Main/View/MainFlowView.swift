//
//  MainFlowView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct MainFlowView: View {
    @EnvironmentObject private var mainVM: MainViewModel
    @ObservedObject var streakVM: StreakViewModel
    @ObservedObject var agentVM: AgentViewModel
    
    var body: some View {
        TabView(selection: $mainVM.selectedTab) {
            
            HomeContainerView(streakVM: streakVM, agentVM: agentVM)
                .tabItem {
                    Label(MainTabRoute.home.title, systemImage: MainTabRoute.home.iconName)
                }
                .tag(MainTabRoute.home)
            
            HomeContainerView(streakVM: streakVM, agentVM: agentVM)
                .tabItem {
                    Label(MainTabRoute.progress.title, systemImage: MainTabRoute.progress.iconName)
                }
                .tag(MainTabRoute.progress)
            
            HomeContainerView(streakVM: streakVM, agentVM: agentVM)
                .tabItem {
                    Label(MainTabRoute.profile.title, systemImage: MainTabRoute.profile.iconName)
                }
                .tag(MainTabRoute.profile)
        }
    }
}

#Preview {
    let networkService = NetworkService()
    MainFlowView(streakVM: StreakViewModel(networkService: networkService), agentVM: AgentViewModel(networkService: networkService))
        .environmentObject(MainViewModel(navigationService: NavigationService()))
}
