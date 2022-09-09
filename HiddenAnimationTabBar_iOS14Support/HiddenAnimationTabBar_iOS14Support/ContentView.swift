//
//  ContentView.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/09.
//

import SwiftUI

struct ContentView: View {
    @State var isHiddenTabBar: Bool = false
    @State var selection: Int = 0
    @State var selectionItem: TabBarItem = .house
    var body: some View {
        GeometryReader { reader in
            ZStack {
                ContentViewTabBarContainerView(selection: $selectionItem) {
                    testView(text: TabBarItem.house.title,
                             bg: .red)
                            .tabBarItem(.house, selection: $selectionItem)
                    
                    testView(text: TabBarItem.car.title,
                             bg: .yellow)
                            .tabBarItem(.car, selection: $selectionItem)
                    
                    testView(text: TabBarItem.person.title,
                             bg: .green)
                            .tabBarItem(.person, selection: $selectionItem)
                    
                    testView(text: TabBarItem.message.title,
                             bg: .purple)
                            .tabBarItem(.message, selection: $selectionItem)
                    
                    testView(text: TabBarItem.phone.title,
                             bg: .orange)
                            .tabBarItem(.phone, selection: $selectionItem)
                    
                    testView(text: TabBarItem.ring.title,
                             bg: .gray)
                            .tabBarItem(.ring, selection: $selectionItem)
                }
                .isHiddenTabBar(isHiddenTabBar)
                .tabViewPresentMode(.sharp)
                
                Button {
                    isHiddenTabBar.toggle()
                } label: {
                    Image(systemName: isHiddenTabBar ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                        .font(.system(size: 20))
                        .frame(width: 44, height: 44)
                        .contentShape(Rectangle())
                }
                .position(x: reader.safeAreaInsets.leading + 20, y: reader.safeAreaInsets.top)
            }
        }

    }
}

extension ContentView {
    private func testView(text: String, bg: Color) -> some View {
        ZStack {
            bg
            Text(text)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12", "iPod touch (7th generation)"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
