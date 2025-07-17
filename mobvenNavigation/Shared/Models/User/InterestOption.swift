//
//  InterestOption.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

enum InterestOption: String, CaseIterable, SelectableOption {
    case travel, food, sports, work, culture, technology, health,
         entertainment, education, shopping, art, relationships,
         animals, music, environment

    var id: String { rawValue }

    var title: String {
        switch self {
        case .travel: return "Travel"
        case .food: return "Food"
        case .sports: return "Sports"
        case .work: return "Work & Business"
        case .culture: return "Culture"
        case .technology: return "Technology"
        case .health: return "Health & Fitness"
        case .entertainment: return "Entertainment"
        case .education: return "Education"
        case .shopping: return "Shopping"
        case .art: return "Art & Design"
        case .relationships: return "Relationships"
        case .animals: return "Animals"
        case .music: return "Music"
        case .environment: return "Environment"
        }
    }

    var icon: String? {
        switch self {
        case .travel: return "airplane"
        case .food: return "takeoutbag.and.cup.and.straw"
        case .sports: return "sportscourt"
        case .work: return "briefcase"
        case .culture: return "globe"
        case .technology: return "desktopcomputer"
        case .health: return "heart"
        case .entertainment: return "star"
        case .education: return "graduationcap"
        case .shopping: return "cart"
        case .art: return "paintbrush"
        case .relationships: return "bubble.left.and.bubble.right"
        case .animals: return "pawprint"
        case .music: return "music.note"
        case .environment: return "leaf"
        }
    }

    var font: Font { .callout }
}


