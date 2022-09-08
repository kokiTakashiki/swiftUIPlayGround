//
//  HiddenAnimationTabBarPatternApp.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/07.
//

#if DEBUG
import SwiftUISimulator
#endif

import SwiftUI

@main
struct HiddenAnimationTabBarPatternApp: App {
    var body: some Scene {
        WindowGroup {
            #if DEBUG
            SimulatorView { // ✅ Please surround the your app's root view with `SimulatorView`.
                ContentView()
            }
            #else
            ContentView()
            #endif
        }
    }
}
