//
//  MainCore.swift
//  MemoApp
//
//  Created by 한태희 on 9/18/24.
//

import Foundation
import ComposableArchitecture

struct MainCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Action: Equatable {
    
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      
      switch action {
      default:
        return .none
      }
    }
  }
}
