//
//  WelcomeViewModel.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

enum WelcomeStep: Int, CaseIterable {
    case intro = 0
    case agents = 1
    case login = 2
    
    var title: String {
        switch self {
        case .intro:
            return "Speak, don't just study"
        case .agents:
            return "Scenarios made for you"
        case .login:
            return "Instant feedback, visible progress"
        }
    }
    
    var description: String {
        switch self {
        case .intro:
            return "Sesli dil matches you with an AI voice partner so you can start real conversations wherever you are"
        case .agents:
            return "Pick Travel, Business, Exam or write your own scene and begin chatting in seconds."
        case .login:
            return "Every session ends with grammar and pronuncation tips, a full transcript and weekly progress stats."
        }
    }
    
    var next: WelcomeStep? {
        let all = Self.allCases
        guard let index = all.firstIndex(of: self), index + 1 < all.count else { return nil }
        return all[index + 1]
    }
    
    var previous: WelcomeStep? {
        let all = Self.allCases
        guard let index = all.firstIndex(of: self), index > 0 else { return nil }
        return all[index - 1]
    }
    
    var isLast: Bool {
        return next == nil
    }
}

final class WelcomeViewModel: ObservableObject {
    @Published var step: WelcomeStep = .intro
    
    func nextStep() {
        if let next = step.next {
            step = next
        }
    }
    
    func previousStep() {
        if let previous = step.previous {
            step = previous
        }
    }
    
    func isLastStep() -> Bool {
        return step.isLast
    }
}
