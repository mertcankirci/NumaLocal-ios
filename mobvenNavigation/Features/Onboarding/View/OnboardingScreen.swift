//
//  OnboardingScreen.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct OnboardingScreen: View {
    
    @EnvironmentObject private var appNav: AppFlowNavigator
    @ObservedObject var onboardingVM: OnboardingViewModel
    
    var body: some View {
        VStack {
            navigationBar()
                .frame(height: 40)
            
            Text(onboardingVM.step.title)
                .foregroundStyle(.primary)
                .fontWeight(.light)
                .font(.title2)
                .padding(.top, 24)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                switch onboardingVM.step {
                case .nativeLanguageSelection:
                    LanguageSelectionView(onboardingVM: onboardingVM, isNativeLanguageSelection: true)
                case .targetLanguageSelection:
                    LanguageSelectionView(onboardingVM: onboardingVM, isNativeLanguageSelection: false)
                case .learningPurposeSelection:
                    LearningPurposeSelectionView(onboardingVM: onboardingVM)
                case .learningGoalSelection:
                    LearningGoalSelectionView(onboardingVM: onboardingVM)
                case .currentLanguageLevel:
                    LanguageLevelSelectionView(onboardingVM: onboardingVM)
                case .ageInput:
                    AgeInputSelectionView(onboardingVM: onboardingVM)
                case .interestSelection:
                    InterestSelectionView(onboardingVM: onboardingVM)
                case .speakingFrequencyGoal:
                    WeeklyGoalSelectionView(onboardingVM: onboardingVM)
                }
            }
            .padding(.top, 8)
            
            Spacer()
            
            if onboardingVM.step.isMultipleSelection {
                Button {
                    withAnimation {
                        onboardingVM.nextStep()
                    }
                } label: {
                    Text("Next")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(hasSelection ? .white : .gray.opacity(0.6))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(hasSelection ? Color.blue : Color.gray.opacity(0.2))
                        )
                }
                .disabled(!hasSelection)
            }
        }
        .padding()
    }
    
    @ViewBuilder
    func navigationBar() -> some View {
        HStack(spacing: 8) {
            if !onboardingVM.step.isFirst {
                Button(action: {
                    withAnimation {
                        onboardingVM.previousStep()
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundStyle(.black)
                }
                Spacer()
            }
            
            
            ProgressIndicator(progressLevel: progressLevel)
            
            Spacer()
            
            Text("\(onboardingVM.step.rawValue + 1) / \(OnboardingStep.allCases.count)")
                .font(.body)
                .fontWeight(.semibold)
        }
    }
    
    private var progressLevel: Float {
        return Float(onboardingVM.step.rawValue + 1) / Float(OnboardingStep.allCases.count)
    }
    
    private var hasSelection: Bool {
        switch onboardingVM.step {
        case .learningPurposeSelection:
            return !onboardingVM.learningPurposes.isEmpty
        case .learningGoalSelection:
            return !onboardingVM.learningGoals.isEmpty
        case .interestSelection:
            return !onboardingVM.interests.isEmpty
        default:
            return true
        }
    }
}

#Preview {
    let persistenceService = PersistenceService()
    
    OnboardingScreen(onboardingVM: OnboardingViewModel(networkService: NetworkService(), sessionManager: UserSessionManager(persistenceService: persistenceService), persistence: persistenceService, flowNav: AppFlowNavigator()))
        .environmentObject(AppFlowNavigator())
}
