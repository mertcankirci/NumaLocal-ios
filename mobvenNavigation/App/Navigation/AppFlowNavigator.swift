//
//  AppFlowNavigator.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 15.07.2025.
//

import Foundation

protocol AppFlowNavigating {
    var current: AppFlow { get }

    func goToOnboarding()
    func goToMain()
}


class AppFlowNavigator: AppFlowNavigating, ObservableObject {
  @Published private(set) var current: AppFlow = .welcome
  
  func goToOnboarding() {
      DispatchQueue.main.async { [weak self] in
          self?.current = .onboarding
      }
  }
  func goToMain() {
      DispatchQueue.main.async { [weak self] in
          self?.current = .main
      }
  }
}
