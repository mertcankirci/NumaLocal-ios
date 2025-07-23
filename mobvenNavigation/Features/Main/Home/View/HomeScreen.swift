//
//  HomeScreen.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject private var homeVM: HomeViewModel
    @EnvironmentObject private var userSessionManager: UserSessionManager
    @ObservedObject var streakVM: StreakViewModel
    @ObservedObject var agentVM: AgentViewModel
    
    @State private var errorMessage: String?
    
    var body: some View {
        ZStack {
            
            Color.background
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    if let userFlagImageString = userSessionManager.user?.targetLanguage.icon {
                        Image(userFlagImageString)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 24)
                    }
                    
                    HStack(spacing:2) {
                        Text("\(homeVM.getGreetingString())")
                            .font(.bodyM14Regular)
                        Text(", \(userSessionManager.user?.name ?? "")")
                            .font(.bodyL14)
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                WeeklyStreakView(streakVM: streakVM)
                    .padding(.top, 14)
                
                Text("Pick Your Agent")
                    .font(.titleL16)
                    .padding(.top, 10)
                
                SelectAgentGridView()
                
                Text("Suggested Prompts")
                    .font(.titleL16)
                    .padding(.top, 9)
                
                SuggestedPromptsView()

                Spacer()
            }
            .padding()
        }
        .onAppear {
            fetchWeeklyStreak()
        }
        .alert("Error", isPresented: .constant(errorMessage != nil), actions: {
            Button("Okay", role: .cancel) {
                errorMessage = nil
            }
        }, message: {
            Text(errorMessage ?? "Unknown error occured.")
        })
    }
    
    private func fetchWeeklyStreak() {
        Task {
            do {
                try await streakVM.fetchUserStreak(for: 1)
            } catch {
                await MainActor.run {
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}

#Preview {
    let networkService = NetworkService()
    let navigationService = NavigationService<HomeRoute>()
    
    HomeScreen(streakVM: StreakViewModel(
                networkService: networkService),
                agentVM: AgentViewModel(networkService: networkService)
    )
    .environmentObject(UserSessionManager())
    .environmentObject(HomeViewModel(navigationService: navigationService))
}

/*
 Text("Home Screen")
 .font(.largeTitle)
 
 Button("Go to Detail") {
 let exampleItem = HomeItem(id: "example", title: "Example Item")
 homeVM.select(item: exampleItem)
 }
 .frame(maxWidth: .infinity)
 .frame(height: 50)
 .background(Color.blue)
 .foregroundColor(.white)
 .cornerRadius(8)
 
 ForEach(homeVM.items) { item in
 Button("Show \(item.title)") {
 homeVM.select(item: item)
 }
 .padding(.horizontal)
 .frame(maxWidth: .infinity, minHeight: 44)
 .background(Color.gray.opacity(0.1))
 .cornerRadius(8)
 }
 
 Spacer()
 */
