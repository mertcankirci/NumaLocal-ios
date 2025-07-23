//
//  Prompt.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 22.07.2025.
//

import Foundation

struct Prompt: Identifiable, Codable, Equatable, Hashable {
    let id: Int
    let title: String
    let description: String
    let iconString: String
}

extension Prompt {
    static let rentCar = Prompt(id: 2,
                                title: "Rent a car",
                                description: "Payment type",
                                iconString: "car")
    
    static let jobInterview = Prompt(id: 3,
                                     title: "Job interview",
                                     description: "Introduce yourself",
                                     iconString: "briefcase-purple")
    
    static let phoneCall = Prompt(id: 4,
                                  title: "Phone call",
                                  description: "Make a plan",
                                  iconString: "call")
    
    static let mockList: [Prompt] = [
        rentCar,
        jobInterview,
        phoneCall
    ]
}
