//
//  FolderCore.swift
//  MemoApp
//
//  Created by 한태희 on 10/4/24.
//

import Foundation
import ComposableArchitecture

struct FolderCore: Reducer {
  struct State: Equatable {
    let folder: Folder?
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
