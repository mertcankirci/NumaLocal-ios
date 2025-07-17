//
//  MainViewModel.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

// Features/Main/ViewModel/MainViewModel.swift
import Foundation

/// Main akışındaki custom tab bar ve genel navigation’u yönetir
final class MainViewModel: ObservableObject {
    /// Seçili tab
    @Published var selectedTab: MainTabRoute = .home

    /// Main flow’un navigation service’i (eğer gerekiyorsa)
    private let navigationService: NavigationService<MainTabRoute>

    init(navigationService: NavigationService<MainTabRoute>) {
        self.navigationService = navigationService
    }

    /// Tab değiştir
    func selectTab(_ tab: MainTabRoute) {
        selectedTab = tab
    }
}

