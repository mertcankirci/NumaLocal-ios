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
        
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                ForEach(InterestOption.allCases) { interest in
                    SelectableCell(
                        option: interest,
                        isSelected: isInterestSelected(for: interest),
                        useInterestPadding: true
                    ) {
                        onboardingVM.toggleInterest(interest)
                    }
                    .padding(5)
                    .alignmentGuide(.leading) { dimension in
                        if (abs(width - dimension.width) > geo.size.width) {
                            width = 0
                            height -= dimension.height
                        }
                        let result = width
                        if interest.id == InterestOption.allCases.last?.id {
                            width = 0
                        } else {
                            width -= dimension.width
                        }
                        return result
                    }
                    .alignmentGuide(.top) { dimension in
                        let result = height
                        if interest.id == InterestOption.allCases.last?.id {
                            height = 0
                        }
                        return result
                    }
                }
            }
        }
    }
    
    private func isInterestSelected(for interest: InterestOption) -> Bool {
        return onboardingVM.interests.contains(interest)
    }
}

#Preview {
    
    let persistenceService = PersistenceService()
    
    InterestSelectionView(onboardingVM: OnboardingViewModel(networkService: NetworkService(), sessionManager: UserSessionManager(persistenceService: persistenceService), persistence: persistenceService, flowNav: AppFlowNavigator()))
}

