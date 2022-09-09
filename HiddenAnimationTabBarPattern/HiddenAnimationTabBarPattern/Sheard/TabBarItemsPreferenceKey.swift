//
//  TabBarItemsPreferenceKey.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/08.
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

enum CustomTabViewPresentMode {
    case crossDissolve
    case sharp
}

extension View {
    @ViewBuilder
    func tabBarItemPresent(tab: TabBarItem, selection: Binding<TabBarItem>, mode: CustomTabViewPresentMode = .sharp) -> some View {
        switch mode {
        case .crossDissolve:
            modifier(TabBarItemViewCrossDissolveModifier(tab: tab, selection: selection))
        case .sharp:
            modifier(TabBarItemViewSharpModifier(tab: tab, selection: selection))
        }
    }
    
    func tabBarItem(_ tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
}

extension View {
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

struct HiddenTabBarKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var isHiddenTabBar: Bool {
        get { self[HiddenTabBarKey.self] }
        set { self[HiddenTabBarKey.self] = newValue }
    }
}

extension View {
    func isHiddenTabBar(_ value: Bool) -> some View {
        environment(\.isHiddenTabBar, value)
    }
}

struct CustomTabViewPresentModeSelectKey: EnvironmentKey {
    static let defaultValue: CustomTabViewPresentMode = .sharp
}

extension EnvironmentValues {
    var customTabViewPresentMode: CustomTabViewPresentMode {
        get { self[CustomTabViewPresentModeSelectKey.self] }
        set { self[CustomTabViewPresentModeSelectKey.self] = newValue }
    }
}

extension View {
    func tabViewPresentMode(_ value: CustomTabViewPresentMode) -> some View {
        environment(\.customTabViewPresentMode, value)
    }
}



