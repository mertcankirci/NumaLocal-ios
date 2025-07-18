//
//  UserStreakModel.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 17.07.2025.
//

import Foundation

struct UserStreakModel: Codable {
    let completedDates: Set<Date>
    let longestStreak: Int
    let currentStreak: Int
    let todayProgress: Float
}
