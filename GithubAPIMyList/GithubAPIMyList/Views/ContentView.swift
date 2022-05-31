//
//  ContentView.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ReposListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([ColorScheme.light, ColorScheme.dark], id: \.self) { colorScheme in
            ForEach(["iPhone 12", "iPod touch (7th generation)"], id: \.self) { deviceName in
                ForEach(["en_US", "ja_JP"], id: \.self) { id in
                    ContentView()
                        .environment(\.locale, .init(identifier: id))
                        .preferredColorScheme(colorScheme)
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .previewDisplayName(deviceName)
                }
            }
        }
    }
}
