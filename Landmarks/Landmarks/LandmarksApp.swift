//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 武田孝騎 on 2021/08/16.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
