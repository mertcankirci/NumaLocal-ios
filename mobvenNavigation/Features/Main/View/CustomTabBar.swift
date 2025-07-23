//
//  CustomTabBar.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

/// Custom tab bar for MainFlowView
struct CustomTabBar: View {
    @Binding var selection: MainTabRoute

    var body: some View {
        HStack {
            ForEach(MainTabRoute.allCases, id: \.self) { tab in
                Button(action: {
                    selection = tab
                }) {
                    VStack(spacing: 4) {
                        Image(tab.iconName)
                            .font(.system(size: 20, weight: .semibold))
                        Text(tab.title)
                            .font(.footnote)
                    }
                    .foregroundColor(selection == tab ? .blue6 : .natural3)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .background(
            Rectangle()
                .fill(Color.white)
                .cornerRadius(32, corners: [.topRight, .topLeft])
        )
    }
}

#if DEBUG
struct CustomTabBar_Previews: PreviewProvider {
    @State static var selection: MainTabRoute = .home

    static var previews: some View {
        CustomTabBar(selection: $selection)
            .previewLayout(.sizeThatFits)
    }
}
#endif
