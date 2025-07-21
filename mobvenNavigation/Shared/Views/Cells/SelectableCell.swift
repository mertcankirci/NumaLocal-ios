//
//  SelectableCell.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct SelectableCell<T: SelectableOption>: View {
    let option: T
    let isSelected: Bool
    var useInterestPadding: Bool = false
    var useCompactPadding: Bool = false
    let onSelect: () -> Void
    
    
    var body: some View {
        Button(action: {
            withAnimation {
                onSelect()
            }
        }) {
            HStack(spacing: 16) {
                // Sol taraf: icon (emoji/SFSymbol) veya levelCode
                if let icon = option.icon {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                } else if let levelCode = (option as? LanguageLevelOption)?.levelCode {
                    Text(levelCode)
                        .font(.bodyL14)
                        .foregroundColor(.natural9)
                        .frame(width: 30, alignment: .leading)
                }
                
                Text(option.title)
                    .font(option.font)
                    .foregroundColor(.natural9)
                    .multilineTextAlignment(.leading)
                
                if !(T.self == InterestOption.self) {
                    Spacer()
                }
            }
            .padding(.vertical, useInterestPadding ? 12 : 16)
            .padding(.horizontal, useCompactPadding ? 24 : 16)
            .background(Color.background)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color.blue6 : Color.natural3, lineWidth: 2)
            )
            .cornerRadius(12)
        }
    }
}

