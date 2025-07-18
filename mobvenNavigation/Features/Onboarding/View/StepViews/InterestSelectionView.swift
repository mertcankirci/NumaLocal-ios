//
//  InterestSelectionView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 17.07.2025.
//

import SwiftUI

struct InterestSelectionView: View {
    @ObservedObject var onboardingVM: OnboardingViewModel
    var body: some View {
        FlowLayoutView(data: InterestOption.allCases) { interest in
            SelectableCell(option: interest,
                           isSelected: onboardingVM.interests.contains(interest),
                           useInterestPadding: true,
                           onSelect: {
                onboardingVM.toggleInterest(interest)
                }
            )
            .fixedSize()
        }
    }
}

#Preview {
    
    let persistenceService = PersistenceService()
    
    InterestSelectionView(onboardingVM: OnboardingViewModel(networkService: NetworkService(), sessionManager: UserSessionManager(persistenceService: persistenceService), persistence: persistenceService, flowNav: AppFlowNavigator()))
}


