//
//  Folder.swift
//  MemoApp
//
//  Created by 한태희 on 9/19/24.
//

import Foundation

struct Folder: Equatable, Hashable {
  let title: String
  let memoList: [Memo]
  let iconName: String = "folder"
}
