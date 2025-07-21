//
//  Agent.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 21.07.2025.
//

import Foundation

struct Agent: Identifiable, Codable, Equatable, Hashable {
    let id: Int
    let name: String
    let avatarURL: String
    let description: String
    let agnetExpertise: AgentExpertise
}

extension Agent {
    static let mockOris = Agent(
        id: 1,
        name: "Oris",
        avatarURL: "person.circle",
        description: "Your travel companion",
        agnetExpertise: .travel
    )

    static let mockParla = Agent(
        id: 2,
        name: "Parla",
        avatarURL: "person.circle",
        description: "Business English guide",
        agnetExpertise: .business
    )

    static let mockNoru = Agent(
        id: 3,
        name: "Noru",
        avatarURL: "person.circle",
        description: "Academic speaking trainer",
        agnetExpertise: .academic
    )

    static let mockSona = Agent(
        id: 4,
        name: "Sona",
        avatarURL: "person.circle",
        description: "General conversation buddy",
        agnetExpertise: .general
    )

    static let mockList: [Agent] = [
        .mockOris,
        .mockParla,
        .mockNoru,
        .mockSona
    ]
}
