//
//  InterestOption.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

enum InterestOption: String, CaseIterable, SelectableOption {
    case travel
    case food
    case music
    case sports
    case technology
    case health
    case culture
    case education
    case work
    case entertainment
    case shopping
    case art
    case relationships
    case animals
    case environment

    var id: String { rawValue }

    var title: String {
        switch self {
        case .travel: return "Travel"
        case .food: return "Food"
        case .music: return "Music"
        case .sports: return "Sports"
        case .technology: return "Technology"
        case .health: return "Health & Fitness"
        case .culture: return "Culture"
        case .education: return "Education"
        case .work: return "Work & Business"
        case .entertainment: return "Entertainment"
        case .shopping: return "Shopping"
        case .art: return "Art & Design"
        case .relationships: return "Relationships"
        case .animals: return "Animals"
        case .environment: return "Environment"
        }
    }

    var icon: String? {
        switch self {
        case .travel: return "airplane"
        case .food: return "calendar"
        case .music: return "music"
        case .sports: return "weight"
        case .technology: return "devices"
        case .health: return "heart"
        case .culture: return "language-square"
        case .education: return "teacher"
        case .work: return "briefcase"
        case .entertainment: return "star"
        case .shopping: return "shopping-bag"
        case .art: return "brush"
        case .relationships: return "celo"
        case .animals: return "pet"
        case .environment: return "tree"
        }
    }
}



