//
//  HiddenTabBarKey.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/09.
//

import SwiftUI

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
