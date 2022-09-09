//
//  ContentView.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/07.
//

import SwiftUI

struct ContentView: View {
    @State var isHiddenTabBar: Bool = false
    @State var selection: Int = 0
    @State var selectionItem: TabBarItem = .house
    var body: some View {
        GeometryReader { reader in
            ZStack {
//                TabContentContainerView(
//                    selection: $selection,
//                    tabsMaxCount: 3
//                ) {
//                    Color.red
//                        .uiTabBarItem(.house)
//                    Color.blue
//                        .uiTabBarItem(.car)
//                    Color.green
//                        .uiTabBarItem(.person)
//                }
//                .isHiddenTabBar(isHiddenTabBar)
                CustomTabBarContainerView(
                    selection: $selectionItem
                ) {
                    Color.red
                        .tabBarItem(tab: .house, selection: $selectionItem)

                    Color.blue
                        .tabBarItem(tab: .car, selection: $selectionItem)

                    Color.green
                        .tabBarItem(tab: .person, selection: $selectionItem)
                    
                    Color.red
                        .tabBarItem(tab: .message, selection: $selectionItem)

                    Color.blue
                        .tabBarItem(tab: .phone, selection: $selectionItem)

                    Color.green
                        .tabBarItem(tab: .ring, selection: $selectionItem)
                }
                .isHiddenTabBar(isHiddenTabBar)
                
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12", "iPod touch (7th generation)"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
