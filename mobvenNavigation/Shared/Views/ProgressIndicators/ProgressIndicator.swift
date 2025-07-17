//
//  ProgressIndicator.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct ProgressIndicator: View {
    let progressLevel: Float
    var height: CGFloat = 8
    var backgroundColor: Color = .gray.opacity(0.2)
    var foregroundColor: Color = .purple

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(backgroundColor)
                    .frame(height: height)

                Capsule()
                    .fill(foregroundColor)
                    .frame(width: CGFloat(progressLevel) * geometry.size.width, height: height)
            }
        }
        .frame(height: height)
    }
}

#Preview {
    ProgressIndicator(progressLevel: 0.5, height: 8)
        .padding()
}

