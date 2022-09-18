//
//  BottomBarViewModel.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/13.
//

import SwiftUI

class BottomBarViewModel: ObservableObject {
    @Published var searchText = "iJustine"
    @Published var offset: CGFloat = 0
    @Published var lastStoredOffset: CGFloat = 0
    @Published var tabState: BottomState = .floating
}

enum BottomState {
    case floating
    case expanded
}
