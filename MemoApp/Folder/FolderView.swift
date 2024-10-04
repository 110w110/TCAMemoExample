//
//  FolderView.swift
//  MemoApp
//
//  Created by 한태희 on 10/4/24.
//

import SwiftUI
import ComposableArchitecture

struct FolderView: View {
  let store: StoreOf<FolderCore>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      ScrollView {
        SearchBar()
      }
      .navigationTitle(viewStore.folder?.title ?? "")
      .navigationBarTitleDisplayMode(.large)
      .toolbar {
        ToolbarItemGroup(placement: .topBarTrailing) {
          Button("편집") {
            
          }
        }
        ToolbarItemGroup(placement: .bottomBar) {
          Button {
            
          } label: {
            Label("", systemImage: "folder.badge.plus")
          }
          Spacer()
          Button {
            
          } label: {
            Label("", systemImage: "square.and.pencil")
          }
        }
      }
      .tint(.yellow)
    }
  }
}
