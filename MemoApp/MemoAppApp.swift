//
//  MemoAppApp.swift
//  MemoApp
//
//  Created by 한태희 on 9/18/24.
//

import SwiftUI

@main
struct MemoAppApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  var body: some Scene {
    WindowGroup {
      MainView(store: appDelegate.store)
    }
  }
}
