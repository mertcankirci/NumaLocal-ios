//
//  LanguageSelectionView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct LanguageSelectionView: View {
    @ObservedObject var onboardingVM: OnboardingViewModel
    
    let isNativeLanguageSelection: Bool
    
    var body: some View {
        VStack(spacing: 12) {
             ForEach(filteredLanguages) { language in
                 SelectableCell(
                     option: language,
                     isSelected: isSelected(language),
                     onSelect: {
                         if isNativeLanguageSelection {
                             onboardingVM.setNativeLanguage(language)
                         } else {
                             onboardingVM.setTargetLanguage(language)
                         }
                         withAnimation {
                             onboardingVM.nextStep()
                         }
                     }
                 )
             }
         }
     }
    
    private var filteredLanguages: [LanguageOption] {
        if isNativeLanguageSelection {
            return LanguageOption.allCases
        } else {
            return LanguageOption.allCases.filter { $0 != onboardingVM.nativeLanguage }
        }
    }
    
    private func isSelected(_ language: LanguageOption) -> Bool {
        isNativeLanguageSelection
            ? onboardingVM.nativeLanguage == language
            : onboardingVM.targetLanguage == language
    }
}

#Preview {
    let persistenceService = PersistenceService()
    
    LanguageSelectionView(onboardingVM: OnboardingViewModel(networkService: NetworkService(), sessionManager: UserSessionManager(persistenceService: persistenceService), persistence: persistenceService, flowNav: AppFlowNavigator()), isNativeLanguageSelection: true)
}
