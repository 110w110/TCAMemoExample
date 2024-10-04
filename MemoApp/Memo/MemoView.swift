//
//  MemoView.swift
//  MemoApp
//
//  Created by 한태희 on 9/19/24.
//

import SwiftUI

struct MemoView: View {
  var body: some View {
    ScrollView {
      SearchBar()
//                section(header: "나의 iPhone")
    }
    .background(
      Color(uiColor: .groupTableViewBackground)
        .edgesIgnoringSafeArea(.all)
    )
    .navigationTitle("폴더")
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
