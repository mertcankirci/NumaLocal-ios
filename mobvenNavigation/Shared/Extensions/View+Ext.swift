//
//  View+Ext.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        self.clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

extension View {
    func frameBehavior(for option: any SelectableOption) -> some View {
        Group {
            if option is InterestOption {
                self.fixedSize()
            } else {
                self.frame(maxWidth: .infinity)
            }
        }
    }
}

