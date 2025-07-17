//
//  StepIndicator.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct StepIndicator: View {
    let currentStep: Int
    let totalSteps: Int
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<totalSteps, id: \.self) { step in
                Capsule()
                    .fill(step <= currentStep ? .blue : .white.opacity(0.8))
                    .frame(width: step == currentStep ? 32 : 8, height: 8)
                    .animation(.easeInOut(duration: 0.3), value: currentStep)
            }
        }
        .animation(.easeInOut, value: currentStep)
    }
}

#Preview {
    StepIndicator(currentStep: 0, totalSteps: 3)
}
