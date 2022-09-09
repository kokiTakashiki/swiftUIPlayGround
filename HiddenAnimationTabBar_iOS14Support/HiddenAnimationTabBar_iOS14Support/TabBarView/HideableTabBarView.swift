//
//  HideableTabBarView.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/10.
//

import SwiftUI

struct HideableTabBarView<Element, Content, TabItem>: View
    where
    Content: View,
    TabItem: View {
    
    //
    // Binding properties
    //
    @Binding private var selectedIndex: Data.Index
    
    //
    // Private properties
    //
    typealias Data = [Element]
    private let data: Data
    private let content: Content
    private let tabItem: (Data.Element, Bool) -> TabItem
    
    //
    // Environment
    //
    @Environment(\.isHiddenTabBar) var isHiddenTabBar: Bool

    init(_ data: Data,
         selectedIndex: Binding<Data.Index>,
         @ViewBuilder content: @escaping () -> Content,
         @ViewBuilder tabItem: @escaping (Data.Element, Bool) -> TabItem
    ) {
        self.data = data
        self.content = content()
        self.tabItem = tabItem
        self._selectedIndex = selectedIndex
    }

    var body: some View {
        GeometryReader { reader in
            ZStack(alignment: .bottom) {

                // create contents
                content

                tabBar(reader: reader)
                    .offset(y: isHiddenTabBar ? 50 + reader.safeAreaInsets.bottom : 0)
                    .animation(.easeInOut(duration: 0.5), value: isHiddenTabBar)

            }
            .ignoresSafeArea(edges: [.bottom])
        }
    }
}

extension HideableTabBarView {
    
    private func tabBar(reader: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            tabBarItems()
            Color.white
                .frame(height: reader.safeAreaInsets.bottom)
        }
    }
    
    private func tabBarItems() -> some View {
        HStack {
            ForEach(data.indices, id: \.self) { index in
                tabItem(data[index], selectedIndex == index)
                    .onTapGesture {
                        switchTo(index: index)
                    }
            }
        }
        .frame(height: 50)
        .background(Color.white)
    }
}

extension HideableTabBarView {
    private func switchTo(index: Int) {
        withAnimation(.easeOut) {
            selectedIndex = index
        }
    }
}
