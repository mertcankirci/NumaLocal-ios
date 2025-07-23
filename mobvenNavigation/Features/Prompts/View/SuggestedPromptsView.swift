//
//  SuggestedPromptsView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 22.07.2025.
//

import SwiftUI

struct SuggestedPromptsView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(Prompt.mockList) { prompt in
                    SuggestedPromptCard(prompt: prompt)
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    SuggestedPromptsView()
}
