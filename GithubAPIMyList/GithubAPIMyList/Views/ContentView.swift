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
        ForEach(["en_US", "ja_JP"], id: \.self) { id in
            ContentView()
                .environment(\.locale, .init(identifier: id))
        }
    }
}
