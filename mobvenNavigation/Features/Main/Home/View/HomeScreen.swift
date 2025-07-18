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

    @State private var errorMessage: String?

    var body: some View {
        VStack {
            Group {
                Text(userSessionManager.user?.targetLanguage.icon ?? "")
                    .font(.title)
                
                Text("Practice now to complete your daily goal!")
                    .padding(.top, 16)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
                
            
            WeeklyStreakView(streakVM: streakVM)
            
            Spacer()
        }
        .padding()
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
    HomeScreen(streakVM: StreakViewModel(networkService: NetworkService()))
        .environmentObject(UserSessionManager())
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
