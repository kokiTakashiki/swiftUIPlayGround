//
//  RootView.swift
//  FirebaseCloudMessagingTest
//
//  Created by 武田孝騎 on 2022/08/09.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var viewModel: RootViewModel
    
    var body: some View {
        TabView(selection: $viewModel.selection) {
            HomeView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("ホーム")
                }
                .tag(1)
            
            Text("テスト")
                .tabItem {
                    Image(systemName: "bell")
                    Text("お知らせ")
                }
                .tag(2)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
