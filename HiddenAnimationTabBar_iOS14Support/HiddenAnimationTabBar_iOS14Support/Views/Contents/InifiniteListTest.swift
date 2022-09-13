//
//  InifiniteListTest.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/10.
//

import SwiftUI

struct InifiniteListTest: View {
  @EnvironmentObject var viewModel: ListViewModel

  var body: some View {
      InfiniteList(data: $viewModel.items,
                   isLoading: $viewModel.isLoading,
                   loadMore: viewModel.loadMore) { item, firstItem, lastItem in
          Text(item.text)
      }
  }
}

struct InfiniteListTest_Previews: PreviewProvider {
  static var previews: some View {
      InifiniteListTest().environmentObject(ListViewModel())
  }
}
