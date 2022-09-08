//
//  CustomTabBarContainerView.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/08.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    @Binding var isHiddenTabBar: Bool
    
    init(selection: Binding<TabBarItem>, isHiddenTabBar: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self._isHiddenTabBar = isHiddenTabBar
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
            
            CustomTabBarView(tabs: tabs, selection: $selection)
                .background(.white)
                .offset(y: isHiddenTabBar ? 50 : 0)
                .animation(.easeInOut(duration: 0.5), value: isHiddenTabBar)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

// optional
struct CustomTabBarContainerView_Previews: PreviewProvider {
    static let tabs:[TabBarItem] = TabBarItem.allCases
    
    static var previews: some View {
        ForEach(["iPhone 12", "iPod touch (7th generation)"], id: \.self) { deviceName in
            
            CustomTabBarContainerView(
                selection: .constant(tabs.first!), isHiddenTabBar: .constant(false)) {
                    Color.red
                }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
