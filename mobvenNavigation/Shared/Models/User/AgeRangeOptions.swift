//
//  AgeRangeOptions.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

enum AgeRangeOption: String, CaseIterable, SelectableOption {
    case range13_18
    case range19_25
    case range26_35
    case range36_50
    case range51Plus

    var id: String { rawValue }

    var title: String {
        switch self {
        case .range13_18: return "13–18"
        case .range19_25: return "19–25"
        case .range26_35: return "26–35"
        case .range36_50: return "36–50"
        case .range51Plus: return "51+"
        }
    }

    var icon: String? {
        return nil 
    }

    var font: Font {
        .body
    }
}

