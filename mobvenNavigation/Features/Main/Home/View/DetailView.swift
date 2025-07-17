//
//  DetailView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct DetailView: View {
    
    let itemID: String
    
    var body: some View {
        Text(itemID)
    }
}

#Preview {
    DetailView(itemID: "a")
}
