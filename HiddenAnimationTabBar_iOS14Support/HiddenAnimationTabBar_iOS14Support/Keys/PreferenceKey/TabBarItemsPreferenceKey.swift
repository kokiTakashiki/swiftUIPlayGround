//
//  TabBarItemsPreferenceKey.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/09.
//

import SwiftUI

struct TabBarItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifier: ViewModifier {
    
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    @Environment(\.customTabViewPresentMode) var mode: CustomTabViewPresentMode
    
    func body(content: Content) -> some View {
        switch mode {
        case .crossDissolve:
            content
                .modifier(TabBarItemViewCrossDissolveModifier(tab: tab, selection: $selection))
        case .sharp:
            content
                .modifier(TabBarItemViewSharpModifier(tab: tab, selection: $selection))
        }
    }
}

struct TabBarItemViewCrossDissolveModifier: ViewModifier {
    
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    @State var localSelection: Bool = false
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1 : 0)
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
}

struct TabBarItemViewSharpModifier: ViewModifier {
    
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    @State var localSelection: Bool = false
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1 : 0)
            .isHidden(localSelection ? true : false, remove: true)
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
            .onChange(of: selection) { newValue in
                localSelection.toggle()
            }
    }
}

extension View {
    func tabBarItem(_ tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
}
