//
//  WeeklyGoalSelectionView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 17.07.2025.
//

import SwiftUI

struct WeeklyGoalSelectionView: View {
    
    @ObservedObject var onboardingVM: OnboardingViewModel
    @EnvironmentObject private var appFlowNav: AppFlowNavigator
    
    var body: some View {
        VStack {
            ForEach(WeeklyGoalOption.allCases) { goal in
                SelectableCell(option: goal, isSelected: onboardingVM.selectedWeeklyGoal == goal, useCompactPadding: true) {
                    onboardingVM.setWeeklyGoal(goal)
                    onboardingVM.completeOnboarding()
                }
            }
        }
    }
}

#Preview {
    let persistenceService = PersistenceService()
    WeeklyGoalSelectionView(onboardingVM: OnboardingViewModel(networkService: NetworkService(), sessionManager: UserSessionManager(persistenceService: persistenceService), persistence: persistenceService, flowNav: AppFlowNavigator()))
        .environmentObject(AppFlowNavigator())
}
