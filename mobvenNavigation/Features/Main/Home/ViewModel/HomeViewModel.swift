//
//  HomeViewModel.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

/// Home tab’ının içindeki listeyi ve detay navigation’ı yönetir
final class HomeViewModel: ObservableObject {
    /// Liste verisi
    @Published var items: [HomeItem] = [
        HomeItem(id: "1", title: "Item 1"),
        HomeItem(id: "2", title: "Item 2"),
        HomeItem(id: "3", title: "Item 3")
    ]

    private let navigationService: NavigationService<HomeRoute>

    init(navigationService: NavigationService<HomeRoute>) {
        self.navigationService = navigationService
    }

    /// Bir öğeye tıklandığında detay ekranına geç
    func select(item: HomeItem) {
        navigationService.navigate(to: .detail(itemID: item.id))
    }

    /// Detaydan geri dönerken çağır
    func goBack() {
        navigationService.back()
    }
}

/// Basit model struct’ı
struct HomeItem: Identifiable {
    let id: String
    let title: String
}


