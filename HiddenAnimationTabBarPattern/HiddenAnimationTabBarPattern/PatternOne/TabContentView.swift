//
//  ContentView.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/07.
//

import SwiftUI

struct TabContentView: View {
    
    let tabContents: [AnyView]
    let tabs: [TabBarItem] //= TabBarItem.allCases
    let tabsMaxCount: Int
    private var uiTabBarItem: [UITabBarItem] = []
    
    @Binding var selection: Int
    @State var isSetupComplete: Bool = false
    @Environment(\.isHiddenTabBar) var isHiddenTabBar: Bool
    
    init(
        selection: Binding<Int>,
        tabs: [TabBarItem],
        tabsMaxCount: Int,
        tabContents: [AnyView]
    ) {
        self._selection = selection
        self.tabs = tabs
        self.tabsMaxCount = tabsMaxCount
        self.tabContents = tabContents
        tabs.forEach { item in
            //uiTabBarItem.append(item.tabBarItem)
        }
    }

    var body: some View {
        TabBarController(tabContents: tabContents,
                         tabs: uiTabBarItem,
                         tabsMaxCount: tabsMaxCount,
                         currentTab: $selection,
                         isSetupComplete: $isSetupComplete)
        .onChange(of: isHiddenTabBar) { newValue in
            isSetupComplete = true
        }
    }
}
