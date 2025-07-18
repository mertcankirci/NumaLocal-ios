//
//  HomeContainerView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

struct HomeContainerView: View {
    @EnvironmentObject private var homeNav: NavigationService<HomeRoute>
    @EnvironmentObject private var homeVM: HomeViewModel
    @ObservedObject var streakVM: StreakViewModel

    var body: some View {
        NavigationContainerView(
            navigationService: homeNav,
            root:
                HomeScreen(streakVM: streakVM)
            ,
            build: { route in
                switch route {
                case .detail(let itemID):
                    return AnyView(
                        DetailView(itemID: itemID)
                            .navigationBarTitle("Detail", displayMode: .inline)
                    )
                }
            }
        )
    }
}

#if DEBUG
struct HomeContainerView_Previews: PreviewProvider {
    static var previews: some View {
        let nav = NavigationService<HomeRoute>()
        let vm  = HomeViewModel(navigationService: nav)
        return HomeContainerView(streakVM: StreakViewModel(networkService: NetworkService()))
            .environmentObject(nav)
            .environmentObject(vm)
    }
}
#endif
