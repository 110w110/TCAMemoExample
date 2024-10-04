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
      NavigationView {
        ScrollView {
          SearchBar()
          section(header: "나의 iPhone")
        }
        .background(
          Color(uiColor: .systemGroupedBackground)
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
  }
  
  @ViewBuilder private func section(header: String = "") -> some View {
    WithViewStore(store, observe: \.folderList) { folderList in
      VStack {
        HStack {
          Text(header)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.black)
          Spacer()
        }
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(uiColor: .systemBackground))
          VStack(spacing: 0) {
            ForEach(folderList.indices, id: \.self) { index in
              row(folder: folderList[index])
              if index < folderList.count - 1 {
                Divider()
                  .padding(.leading, 60)
              }
            }
          }
        }
      }
      .padding(.horizontal, 20)
      .padding(.vertical, 5)
    }
  }
  
  @ViewBuilder private func row(folder: Folder) -> some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      NavigationLinkStore(self.store.scope(state: \.$folderState, action: { .folder($0) })) {
        viewStore.send(.folderItemTouched(folder))
      } destination: {
        FolderView(store: $0)
      } label: {
        HStack {
          Image(systemName: folder.iconName)
            .resizable()
            .foregroundColor(.yellow)
            .frame(width: 24, height: 20)
          Text(folder.title)
            .foregroundColor(Color(uiColor: .label))
            .padding(.horizontal, 10)
          Spacer()
          Text("\(folder.memoList.count)")
            .foregroundColor(.gray)
          Image(systemName: "chevron.right")
            .foregroundColor(.gray)
        }
        .frame(height: 40)
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
      }
    }
  }
}

struct SearchBar: View {
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color(uiColor: .systemGray5))
      HStack {
        Image(systemName: "magnifyingglass")
        Text("검색")
        Spacer()
        Image(systemName: "mic.fill")
      }
      .foregroundColor(Color(uiColor: .gray))
      .padding(.horizontal, 5)
    }
    .frame(height: 36)
    .padding(.horizontal, 20)
    .padding(.vertical, 5)
  }
}
