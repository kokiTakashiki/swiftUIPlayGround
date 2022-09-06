//
//  GithubAPIMyListApp.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

#if DEBUG
import SwiftUISimulator
#endif

import SwiftUI

@main
struct GithubAPIMyListApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
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
