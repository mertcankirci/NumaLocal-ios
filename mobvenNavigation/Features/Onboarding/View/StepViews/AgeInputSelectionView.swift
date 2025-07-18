//
//  AgeInputSelectionView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct AgeInputSelectionView: View {
//    @EnvironmentObject private var userInfoVM: UserInfoViewModel
    @ObservedObject var onboardingVM: OnboardingViewModel

    var body: some View {
        VStack(spacing: 16) {
            ForEach(AgeRangeOption.allCases) { range in
                SelectableCell(
                    option: range,
                    isSelected: onboardingVM.ageRange == range,
                    useCompactPadding: true,
                    onSelect: {
                        onboardingVM.setAgeRange(range)
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
    AgeInputSelectionView(onboardingVM: OnboardingViewModel(networkService: NetworkService(), sessionManager: UserSessionManager(persistenceService: persistenceService), persistence: persistenceService, flowNav: AppFlowNavigator()))
}
