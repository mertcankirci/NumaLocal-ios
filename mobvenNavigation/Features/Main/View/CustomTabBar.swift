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
                        Image(systemName: tab.iconName)
                            .font(.system(size: 20, weight: .semibold))
                        Text(tab.title)
                            .font(.footnote)
                    }
                    .foregroundColor(selection == tab ? .blue : .gray)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .background(Color(UIColor.systemBackground).shadow(radius: 2))
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
