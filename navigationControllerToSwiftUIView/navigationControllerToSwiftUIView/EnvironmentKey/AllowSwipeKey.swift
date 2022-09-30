//
//  allowSwipeKey.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/09/30.
//

import SwiftUI

struct allowSwipeKey: EnvironmentKey {
    static let defaultValue: Bool = true
}

extension EnvironmentValues {
    var isAllowSwipe: Bool {
        get { self[allowSwipeKey.self] }
        set { self[allowSwipeKey.self] = newValue }
    }
}
