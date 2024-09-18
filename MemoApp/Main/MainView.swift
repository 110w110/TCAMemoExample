//
//  MainView.swift
//  MemoApp
//
//  Created by 한태희 on 9/18/24.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
  let store: StoreOf<MainCore>
  
  var body: some View {
    WithViewStore(store, observe: { $0 }) { viewStore in
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
  }
}
