//
//  LearningGoalSelectionView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct LearningGoalSelectionView: View {
    @ObservedObject var onboardingVM: OnboardingViewModel

    var body: some View {
        VStack(spacing: 16) {
            ForEach(LearningGoalOption.allCases) { goal in
                SelectableCell(
                    option: goal,
                    isSelected: onboardingVM.learningGoals.contains(goal),
                    onSelect: {
                        onboardingVM.toggleLearningGoal(goal)
                    }
                )
            }
        }
    }
}

#Preview {
    let persistenceService = PersistenceService()
    LearningGoalSelectionView(onboardingVM: OnboardingViewModel(networkService: NetworkService(), sessionManager: UserSessionManager(persistenceService: persistenceService), persistence: persistenceService, flowNav: AppFlowNavigator()))
}
