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
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Content
            Group {
                switch mainVM.selectedTab {
                case .home:
                    HomeContainerView(streakVM: streakVM)
                case .chat:
                    EmptyView()
                case .progress:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // MARK: - Custom Tab Bar
            CustomTabBar(selection: $mainVM.selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    MainFlowView(streakVM: StreakViewModel(networkService: NetworkService()))
        .environmentObject(MainViewModel(navigationService: NavigationService()))
}
