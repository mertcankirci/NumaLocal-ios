//
//  WelcomeScreen.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct WelcomeScreen: View {
    
    @EnvironmentObject private var appNav: AppFlowNavigator
    @ObservedObject var loginVM: LoginViewModel
    @ObservedObject var welcomeVM: WelcomeViewModel
    
    let colors: [Color] = [.black, .black.opacity(0.2)]
    let image = Image("onboarding-bg-image")
    
    var body: some View {
        let screen = UIScreen.main.bounds
        
        ZStack {
            GradientImageView(image: image, colors: colors)
                .frame(width: screen.width, height: screen.height)
            VStack {
                
                Spacer()
                
                mainContent()
                    .padding(.horizontal, 16)
                
                bottomContainer()
                    .frame(height: screen.height / 5)
                    .padding(.top, 32)
            }
        }
        .ignoresSafeArea()
        .gesture(
            DragGesture()
                .onEnded({ gesture in
                    withAnimation {
                        let horizontalDragAmount = gesture.translation.width
                        
                        if horizontalDragAmount > 100 {
                            welcomeVM.previousStep()
                        } else if horizontalDragAmount < -100 {
                            welcomeVM.nextStep()
                        }
                    }
                })
        )
    }
    
    @ViewBuilder
    func mainContent() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            
            StepIndicator(currentStep: welcomeVM.step.rawValue, totalSteps: WelcomeStep.allCases.count)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                ForEach(WelcomeStep.allCases, id: \.self) { step in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(step.title)
                            .font(.headlineXL26)
                            .foregroundStyle(.white)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text(step.description)
                            .font(.bodyM14Regular)
                            .foregroundStyle(.white)
                    }
                    .opacity(welcomeVM.step == step ? 1 : 0)
                    .animation(.easeInOut, value: welcomeVM.step)
                }
            }
            .frame(maxHeight: 140)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 16)
    }
    
    @ViewBuilder
    func loginButton() -> some View {
        Button {
            continueButtonTapped()
        } label: {
            Text("Continue")
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.blue)
                )
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func bottomContainer() -> some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .cornerRadius(18, corners: [.topLeft, .topRight])
            
            loginButton()
                .padding(.bottom, 32)
        }
    }
    
    private func continueButtonTapped() {
        Task {
            do {
                try await loginVM.signIn()
            } catch(let error) {
                print(error)
            }
        }
    }
}

#Preview {
    let appFlowNavigator = AppFlowNavigator()
    let appleSignInService = AppleSignInManager()
    let networkService = NetworkService()
    let persistenceService = PersistenceService()
    WelcomeScreen(loginVM: LoginViewModel(appleSignInService: appleSignInService, networkService: networkService, sessionManager: UserSessionManager(persistenceService: persistenceService), flowNav: appFlowNavigator), welcomeVM: WelcomeViewModel())
    .environmentObject(appFlowNavigator)
}
