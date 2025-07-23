//
//  SelectAgentCard.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 22.07.2025.
//

import SwiftUI

struct SelectAgentCard: View {
    let agent: Agent

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(agent.name)
                    .font(.titleL16)

                Text("\(agent.agnetExpertise.displayName) Agent")
                    .font(.bodyM12Regular)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: 6)

            Image(agent.avatarURL)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .padding([.top, .horizontal])
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue1)
        )
        .aspectRatio(1.12, contentMode: .fit)
    }
}


#Preview {
    SelectAgentCard(agent: .mockNoru)
        .frame(width: 162, height: 145)
}
