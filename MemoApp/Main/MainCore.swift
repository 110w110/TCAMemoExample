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
    @PresentationState var folderState: FolderCore.State?
    
    let folderList: [Folder] = [
      Folder(title: "모든 나의 iPhone", memoList: [
        Memo(title: "동해물과", content: "백두산이", createdDate: "20240918000000", modifiedDate: "20240918000000"),
        Memo(title: "울릉도", content: "동남쪽 뱃길따라 이백리", createdDate: "20240919013030", modifiedDate: "20240919013030")]),
      Folder(title: "메모", memoList: []),
      Folder(title: "새로운 폴더", memoList: [
        Memo(title: "Test", content: "testtest", createdDate: "20200101000000", modifiedDate: "20200101000000")])
    ]
  }
  
  enum Action: Equatable {
    case printHello
    
    case folder(PresentationAction<FolderCore.Action>)
    case folderItemTouched(Folder)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .printHello:
        print("Hello")
        return .none
        
      case .folderItemTouched(let folder):
        state.folderState = .init(folder: folder)
        return .none
        
      default:
        return .none
      }
    }
    .ifLet(\.$folderState, action: /Action.folder) {
      FolderCore()
    }
  }
}
