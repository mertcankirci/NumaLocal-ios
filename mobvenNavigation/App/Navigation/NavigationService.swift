//
//  NavigationService.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 15.07.2025.
//

import Foundation

protocol NavigationServiceProtocol: ObservableObject {
    associatedtype Route: Hashable
    
    var path: [Route] { get set }
    
    func navigate(to route: Route)
    func back()
    func toRoot()
    func replaceLast(with route: Route)
    func canGoBack() -> Bool
}

class NavigationService<Route: Hashable>: NavigationServiceProtocol {
    @Published var path: [Route] = []
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func back() {
        guard canGoBack() else { return }
        path.removeLast()
    }
    
    func toRoot() {
        path.removeAll()
    }
    
    func replaceLast(with route: Route) {
        guard !canGoBack() else { path.append(route); return }
        path[path.count-1] = route
    }
    
    func canGoBack() -> Bool {
        !path.isEmpty
    }
}
