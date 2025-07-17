//
//  HomeScreen.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject private var homeVM: HomeViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Home Screen")
                .font(.largeTitle)
            
            // Tek bir butonla detail ekranına gitmek
            Button("Go to Detail") {
                // Örnek olarak sabit bir item gönderiyoruz
                let exampleItem = HomeItem(id: "example", title: "Example Item")
                homeVM.select(item: exampleItem)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            // Veya liste üzerinden çoklu buton:
            ForEach(homeVM.items) { item in
                Button("Show \(item.title)") {
                    homeVM.select(item: item)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeScreen()
}
