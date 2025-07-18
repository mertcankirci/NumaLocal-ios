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

        HStack(spacing: 8) {
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
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    let networkService = NetworkService()
    WeeklyStreakView(streakVM: StreakViewModel(networkService: networkService))
}
