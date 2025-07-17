//
//  FlowLayoutView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 17.07.2025.
//

import SwiftUI

struct FlowLayoutView<Data: RandomAccessCollection, Content: View>: View where Data.Element: Identifiable {
    var data: Data
    var spacing: CGFloat = 8
    var horizontalPadding: CGFloat = 16
    var content: (Data.Element) -> Content

    @State private var totalHeight: CGFloat = .zero

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var rows: [[Data.Element]] = [[]]

        let estimatedItemHeight: CGFloat = viewSize(view: content(data.first!)).height
        
        for item in data {
            let view = content(item)
            let size = viewSize(view: view)
            
            if width + size.width + spacing > geometry.size.width - horizontalPadding * 2 {
                width = 0
                rows.append([item])
            } else {
                rows[rows.count - 1].append(item)
            }

            width += size.width + spacing
        }

        DispatchQueue.main.async {
            let rowHeights = rows.map { _ in estimatedItemHeight }
            let total = rowHeights.reduce(0, +) + CGFloat(rows.count - 1) * spacing
            self.totalHeight = total
        }

        return VStack(alignment: .center, spacing: spacing) {
            ForEach(0..<rows.count, id: \.self) { rowIndex in
                HStack(spacing: spacing) {
                    ForEach(rows[rowIndex]) { item in
                        content(item)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding(.horizontal, horizontalPadding)
    }

    private func viewSize(view: some View) -> CGSize {
        let controller = UIHostingController(rootView: view)
        return controller.view.intrinsicContentSize
    }
}
