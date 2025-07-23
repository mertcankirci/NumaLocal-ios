//
//  SelectAgentGridView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 22.07.2025.
//

import SwiftUI

struct SelectAgentGridView: View {
    
    let agents: [Agent] = Agent.mockList
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(agents) { agent in
                SelectAgentCard(agent: agent)
            }
        }
    }
}

#Preview {
    SelectAgentGridView()
}
