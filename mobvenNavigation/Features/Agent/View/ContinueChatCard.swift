//
//  ContinueChatCard.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 21.07.2025.
//

import SwiftUI

struct ContinueChatCard: View {
    
    let agent: Agent
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 16) {
                Image(systemName: agent.avatarURL)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.secondary)
                    .frame(width: geo.size.width * 0.2)
                    .padding(.trailing, 4)
                
                VStack(alignment: .leading) {
                    Text("Pick up where you left off")
                        .font(.title3)
                    Text("Complete your chat with \(agent.name) to improve your skills!")
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        Color(.secondarySystemBackground)
                    )
            )
        }
    }
}

#Preview {
    let screen = UIScreen.main.bounds
    ContinueChatCard(agent: .mockNoru)
        .frame(width: screen.width, height: 300)
}
