//
//  AgentViewModel.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 21.07.2025.
//

import Foundation

protocol AgentServiceProtocol {
    func fetchAgents() async throws -> [Agent]
}

final class AgentViewModel: ObservableObject {
    @Published var agents: [Agent] = []
    
    let networkService: NetworkServicable
    
    init(networkService: NetworkServicable) {
        self.networkService = networkService
    }
    
    func fetchAgents() async {
        do {
            let agentList = try await networkService.fetchAgents()
            await MainActor.run {
                self.agents = agentList
            }
        } catch {
            print("Error fetching agents: \(error)")
        }
    }
}
