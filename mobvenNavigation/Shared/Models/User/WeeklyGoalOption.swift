//
//  WeeklyGoalOption.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 17.07.2025.
//

import Foundation

enum WeeklyGoalOption: String, CaseIterable, SelectableOption {
    case once = "Once a week"
    case twoToThree = "2–3 days a week"
    case fourToFive = "4–5 days a week"
    case everyDay = "Every day"

    var id: String { rawValue }

    var title: String { rawValue }

    var icon: String? { nil }
}

