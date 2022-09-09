//
//  CustomTabViewPresentModeSelectKey.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/09.
//

import SwiftUI

enum CustomTabViewPresentMode {
    case crossDissolve
    case sharp
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
