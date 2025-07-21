//
//  WeeklyStreakView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 18.07.2025.
//

import SwiftUI

struct WeeklyStreakView: View {
    @ObservedObject var streakVM: StreakViewModel

    var body: some View {
        let weeklyStreakData = streakVM.calculateWeeklyCompletion()

        VStack(alignment: .leading) {
            
            Text(topTitle())
                .font(.bodyL14)
                .foregroundColor(.black)
                .offset(x: -3) // Because of we used stroke in daily completion view there is a visual misunderstanding about the alignment so we fix it by shifting the text 3pxs
                
            HStack {
                ForEach(Array(weeklyStreakData.enumerated()), id: \.offset) { index, element in
                    let (shortDay, isCompleted) = element

                    StreakDayCompletionView(
                        shortDay: shortDay,
                        isCompleted: isCompleted,
                        isToday: streakVM.todayIndex() == index,
                        todayProgress: streakVM.todayIndex() == index ? streakVM.userStreakModel?.todayProgress ?? 0 : 0
                    )
                }
            }
        }
        .padding()
        .padding(.leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func topTitle() -> String {
        var title = String()
        if let progress = streakVM.userStreakModel?.todayProgress, progress > 0 {
            title = "Off to a great start!"
        } else {
            title = "Ready to start your day?"
        }
        
        return title
    }
}

#Preview {
    let networkService = NetworkService()
    WeeklyStreakView(streakVM: StreakViewModel(networkService: networkService))
}
