//
//  AppFlowNavigator.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 15.07.2025.
//

import Foundation

class AppFlowNavigator: ObservableObject {
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
