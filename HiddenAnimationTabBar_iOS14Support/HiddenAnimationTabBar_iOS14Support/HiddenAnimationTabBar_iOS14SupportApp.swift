//
//  HiddenAnimationTabBar_iOS14SupportApp.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/09.
//

import SwiftUI

@main
struct HiddenAnimationTabBar_iOS14SupportApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ListViewModel())
        }
    }
}
