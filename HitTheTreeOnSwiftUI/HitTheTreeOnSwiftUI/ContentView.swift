//
//  ContentView.swift
//  HitTheTreeOnSwiftUI
//
//  Created by 武田孝騎 on 2022/10/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainSceneView(renderer: Renderer())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
