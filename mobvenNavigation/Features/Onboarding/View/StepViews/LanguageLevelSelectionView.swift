//
//  LanguageLevelSelectionView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct LanguageLevelSelectionView: View {
    @ObservedObject var onboardingVM: OnboardingViewModel

    var body: some View {
        VStack(spacing: 16) {
            ForEach(LanguageLevelOption.allCases) { level in
                SelectableCell(
                    option: level,
                    isSelected: onboardingVM.languageLevel == level,
                    onSelect: {
                        onboardingVM.setLanguageLevel(level)
                        withAnimation {
                            onboardingVM.nextStep()
                        }
                    }
                )
            }
        }
    }
}

#Preview {
    let persistenceService = PersistenceService()
    LanguageLevelSelectionView(onboardingVM: OnboardingViewModel(networkService: NetworkService(), sessionManager: UserSessionManager(persistenceService: persistenceService), persistence: persistenceService, flowNav: AppFlowNavigator()))
}
