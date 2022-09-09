//
//  ContentViewTabBarContainerView.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/09.
//

import SwiftUI

struct ContentViewTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    private let content: Content
    
    //
    // Private properties
    //
    private let tabsMaxCount = TabBarItem.allCases.count
    @State private var tabs: [TabBarItem] = []
    
    //
    // Environment
    //
    @Environment(\.isHiddenTabBar) var isHiddenTabBar: Bool

    init(selection: Binding<TabBarItem>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._selection = selection
        self.content = content()
    }

    var body: some View {
        GeometryReader { reader in
            ZStack(alignment: .bottom) {

                // create contents
                tabContents()

                tabBar(reader: reader)
                    .offset(y: isHiddenTabBar ? 50 + reader.safeAreaInsets.bottom : 0)
                    .animation(.easeInOut(duration: 0.5), value: isHiddenTabBar)

            }
            .ignoresSafeArea(edges: [.bottom])
            .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
                self.tabs = value
            })
        }
    }
}

extension ContentViewTabBarContainerView {
    
    @ViewBuilder
    func tabContents() -> some View {
        // Sharp対応：
        // CustomTabViewPresentModeがcrossDissolveでよければ下記コードのみ
        //
        // content
        //     .ignoresSafeArea(edges: [.bottom])
        //
        
        // tabの取得用画面ロード。取得後は削除。
        content
            .frame(width: 0, height: 0)
            .isHidden(tabs.count == tabsMaxCount ? true : false, remove: true)

        if tabs.count == tabsMaxCount {
            // コンテンツの表示
            content
        }
    }
    
    @ViewBuilder
    private func tabBar(reader: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            tabBarItems()
            Color.white
                .frame(height: reader.safeAreaInsets.bottom)
        }
    }
    
    private func tabBarItems() -> some View {
        CustomTabBarGenericView(
            tabs,
            selectedIndex: Binding(
                get: {
                    selection.rawValue
                },
                set: {
                    selection = TabBarItem(rawValue: $0) ?? .house
                }),
            content: { item, isSelected  in
                VStack {
                    Image(systemName: item.iconName)
                        .font(.title)
                    Text(item.title)
                        .font(.footnote)
                }
                .foregroundColor(isSelected ? item.color : .gray)
                .padding(.vertical,8)
                .frame(maxWidth: .infinity)
            }
        )
    }
}
