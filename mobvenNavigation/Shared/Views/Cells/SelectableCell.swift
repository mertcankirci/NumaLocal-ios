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
            HStack(alignment: .top, spacing: 16) {
                // Sol taraf: icon (emoji/SFSymbol) veya levelCode
                if let icon = option.icon {
                    if icon.containsEmoji {
                        Text(icon)
                            .font(.title2)
                    } else {
                        Image(systemName: icon)
                            .font(useInterestPadding ? option.font : .title3)
                    }
                } else if let levelCode = (option as? LanguageLevelOption)?.levelCode {
                    Text(levelCode)
                        .foregroundStyle(.black)
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: 30, alignment: .leading)
                }

                Text(option.title)
                    .font(option.font)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
            
                if !(T.self == InterestOption.self) {
                    Spacer()
                }
            }
            .padding(.vertical, useInterestPadding ? 12 : 16)
            .padding(.horizontal, useCompactPadding ? 24 : 16)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color.blue : Color.gray.opacity(0.4), lineWidth: 2)
            )
            .cornerRadius(8)
        }
    }
}

