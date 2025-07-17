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

    var body: some View {
        NavigationContainerView(
            navigationService: homeNav,
            root: HomeScreen(),
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
        return HomeContainerView()
            .environmentObject(nav)
            .environmentObject(vm)
    }
}
#endif
