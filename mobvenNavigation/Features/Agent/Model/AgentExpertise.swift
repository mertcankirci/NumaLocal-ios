//
//  AgentExpertise.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 21.07.2025.
//

import Foundation

enum AgentExpertise: String, CaseIterable, Codable, Equatable, Identifiable, Hashable {
    case travel
    case business
    case academic
    case general
    case unknown // fallback değeri

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .travel: return "Travel"
        case .business: return "Business"
        case .academic: return "Academic"
        case .general: return "General"
        case .unknown: return "Unknown"
        }
    }

    var systemImageName: String {
        switch self {
        case .travel: return "airplane"
        case .business: return "briefcase"
        case .academic: return "graduationcap"
        case .general: return "person.2"
        case .unknown: return "questionmark.circle"
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = AgentExpertise(rawValue: rawValue) ?? .unknown
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.rawValue)
    }
}

