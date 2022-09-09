//
//  UITabBarItemsPreferenceKey.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/09.
//

import SwiftUI

// UITabBarItemsPreferenceKey
//struct UITabBarItemsPreferenceKey: PreferenceKey {
//    static var defaultValue: [TabBarItem] = []
//
//    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
//        value += nextValue()
//    }
//}
//
//struct UITabBarItemViewModifier: ViewModifier {
//
//    let tab: TabBarItem
//
//    func body(content: Content) -> some View {
//        content
//            .preference(key: UITabBarItemsPreferenceKey.self, value: [tab])
//    }
//}
//
//extension View {
//    func uiTabBarItem(_ tab: TabBarItem) -> some View {
//        //modifier(UITabBarItemViewModifier(tab: tab))
//        preference(key: UITabBarItemsPreferenceKey.self, value: [tab])
//    }
//}

//struct UITabBarItemsKey: EnvironmentKey {
//    static let defaultValue: [TabBarItem] = []
//}
//
//extension EnvironmentValues {
//    var uiTabBarItems: [TabBarItem] {
//        get { self[UITabBarItemsKey.self] }
//        set { self[UITabBarItemsKey.self] += newValue }
//    }
//}
//
//extension View {
//    func uiTabBarItem(_ value: TabBarItem) -> some View {
//        //modifier(UITabBarItemViewModifier(tab: tab))
//        environment(\.uiTabBarItems, [value])
//    }
//}




struct SetupCompleteKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var isSetupComplete: Bool {
        get { self[SetupCompleteKey.self] }
        set { self[SetupCompleteKey.self] = newValue }
    }
}

extension View {
    func isSetupComplete() -> some View {
        environment(\.isSetupComplete, true)
    }
}
