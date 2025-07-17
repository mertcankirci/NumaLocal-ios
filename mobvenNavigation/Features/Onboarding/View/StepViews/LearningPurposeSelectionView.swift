//
//  LearningPurposeSelectionView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct LearningPurposeSelectionView: View {
    @EnvironmentObject private var onboardingVM: OnboardingViewModel

    var body: some View {
        VStack(spacing: 16) {
            ForEach(LearningPurposeOption.allCases) { purpose in
                SelectableCell(
                    option: purpose,
                    isSelected: onboardingVM.learningPurposes.contains(purpose),
                    onSelect: {
                        onboardingVM.toggleLearningPurpose(purpose)
                    }
                )
            }
        }
    }
}

#Preview {
    let persistenceService = PersistenceService()
    LearningPurposeSelectionView()
        .environmentObject(OnboardingViewModel(networkService: NetworkService(), sessionManager: UserSessionManager(persistenceService: persistenceService), persistence: persistenceService, flowNav: AppFlowNavigator()))
}
