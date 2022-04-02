//
//  ContentView.swift
//  webViewTest
//
//  Created by 武田孝騎 on 2022/03/27.
//

import SwiftUI

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}

struct ContentView: View {
    
    @State private var showLoading: Bool = false
    
    var body: some View {
        VStack {
            WebViewPatternOne(url: URL(string: "https:www.google.com")!, showLoading: $showLoading)
                .overlay(showLoading ? ProgressView("Loading ...").toAnyView(): EmptyView().toAnyView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
