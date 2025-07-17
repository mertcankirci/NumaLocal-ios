//
//  NavigationContainerView.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 15.07.2025.
//

// App/Navigation/NavigationContainerView.swift
import SwiftUI

/// RouteProtocol’ü konform tüm enum’larınızı kullanabilirsiniz.
struct NavigationContainerView<Route: Hashable, Content: View>: View {
    @ObservedObject var navigationService: NavigationService<Route>
    let root: Content
    let build: (Route) -> AnyView

    var body: some View {
        Group {
            if #available(iOS 16.0, *) {
                // iOS 16+: NavigationStack + path + navigationDestination
                NavigationStack(path: $navigationService.path) {
                    root
                        .navigationDestination(for: Route.self) { route in
                            build(route)
                        }
                }
            } else {
                // iOS 15: Fallback NavigationView + hidden NavigationLink’ler
                NavigationView {
                    ZStack {
                        root
                            .navigationBarHidden(true)

                        ForEach(Array(navigationService.path.enumerated()), id: \.offset) { idx, route in
                            NavigationLink(
                                destination: build(route)
                                    .navigationBarHidden(true),
                                isActive: .constant(idx == navigationService.path.count - 1),
                                label: { EmptyView() }
                            )
                            .hidden()
                        }
                    }
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
}

