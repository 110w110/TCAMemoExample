//
//  AppDelegate.swift
//  MemoApp
//
//  Created by 한태희 on 9/18/24.
//

import SwiftUI
import ComposableArchitecture

final class AppDelegate: NSObject, UIApplicationDelegate {
  static private(set) var instance: AppDelegate! = nil
  
  let store = StoreOf<MainCore>(
    initialState: .init(), reducer: {
      MainCore()
    }
  )
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    AppDelegate.instance = self
    
    return true
  }
}

extension AppDelegate {
  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    
    let configuration = UISceneConfiguration(
      name: nil,
      sessionRole: connectingSceneSession.role)
    if connectingSceneSession.role == .windowApplication {
      configuration.delegateClass = SceneDelegate.self
    }
    return configuration
  }
}
