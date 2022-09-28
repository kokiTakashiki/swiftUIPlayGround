//
//  ContentView.swift
//  PageTabViewStyleTest
//
//  Created by 武田孝騎 on 2022/08/08.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        PagerView(index: $selection, endIndex: 3) {
            Color.blue
            Color.red
            Color.yellow
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
