//
//  SuggestedPromptCard.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 22.07.2025.
//

import SwiftUI

struct SuggestedPromptCard: View {
    let prompt: Prompt

    var body: some View {
        HStack(spacing: 12) {
            Image(prompt.iconString)
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)

            VStack(alignment: .leading, spacing: 4) {
                Text(prompt.title)
                    .font(.bodyM14Regular)
                    .foregroundColor(.natural9)

                Text(prompt.description)
                    .font(.bodyM10Regular)
                    .foregroundColor(.natural9)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        )
        .frame(minWidth: 140, maxWidth: 180)
        .fixedSize(horizontal: true, vertical: false)
        .aspectRatio(2.4, contentMode: .fit)
    }
}

#Preview {
    SuggestedPromptCard(prompt: .rentCar)
}
