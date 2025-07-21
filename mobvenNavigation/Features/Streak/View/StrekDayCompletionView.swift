//
//  StrekDayCompletionView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 18.07.2025.
//

import SwiftUI

struct StreakDayCompletionView: View {
    let shortDay: String
    let isCompleted: Bool
    let isToday: Bool
    let todayProgress: Float

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            progressComponent()
                .frame(width: 24, height: 24)

            Text(shortDay)
                .font(.bodyM12)
                .foregroundColor(Color.blue6)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 16)

    }

    @ViewBuilder
    func progressComponent() -> some View {
        let remainingProgress = 1 - CGFloat(todayProgress)
        
        ZStack {
            if isToday {
                Circle()
                    .stroke(Color.blue1, lineWidth: 7)
                
                Circle()
                    .trim(from: remainingProgress, to: 1.0)
                    .stroke(Color.blue6, lineWidth: 7)
                    .rotationEffect(.degrees(-90))
            } else {
                Circle()
                    .stroke(isCompleted ? Color.blue6 : Color.natural1, lineWidth: 7)
            }
        }
    }
}

/*
 if isToday {
     ZStack {
         Circle()
             .stroke(Color.gray.opacity(0.3), lineWidth: 3)

         Circle()
             .trim(from: remainingProgress, to: 1.0)
             .stroke(Color.purple, lineWidth: 3)
             .rotationEffect(.degrees(-90))
     }
     .padding(2)
 } else {
     ZStack {
         RoundedRectangle(cornerRadius: 4)
             .fill(isCompleted ? Color.purple : Color.clear)
             .overlay(
                 RoundedRectangle(cornerRadius: 4)
                     .stroke(isCompleted ? Color.clear : Color.gray.opacity(0.5), lineWidth: 2)
             )

         if isCompleted {
             Image(systemName: "checkmark")
                 .font(.system(size: 12, weight: .bold))
                 .foregroundColor(.white)
         }
     }
 }
 */

#Preview {
    HStack {
        StreakDayCompletionView(shortDay: "Mon", isCompleted: true, isToday: false, todayProgress: 0)
        StreakDayCompletionView(shortDay: "Tue", isCompleted: false, isToday: false, todayProgress: 0)
        StreakDayCompletionView(shortDay: "Wed", isCompleted: false, isToday: true, todayProgress: 0.4)
        StreakDayCompletionView(shortDay: "Mon", isCompleted: true, isToday: false, todayProgress: 0)
        StreakDayCompletionView(shortDay: "Tue", isCompleted: false, isToday: false, todayProgress: 0)
        StreakDayCompletionView(shortDay: "Wed", isCompleted: false, isToday: true, todayProgress: 0.4)
        StreakDayCompletionView(shortDay: "Mon", isCompleted: true, isToday: false, todayProgress: 0)
    }
    .frame(maxWidth: .infinity)
}

