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
    private let tabsMaxCount = TabBarItem.allCases.count
    @State private var tabs: [TabBarItem] = []
    @Environment(\.isHiddenTabBar) var isHiddenTabBar: Bool
    
    init(
        selection: Binding<TabBarItem>,
        @ViewBuilder content: () -> Content
    ) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { reader in
            ZStack(alignment: .bottom) {
                if tabs.count == tabsMaxCount {
                    content
                        .ignoresSafeArea(edges: [.bottom])
                } else {
                    content
                        .isHidden(tabs.count == tabsMaxCount ? true : false, remove: true)
                }
                
//                CustomTabBarView(
//                    tabs: tabs,
//                    selection: $selection
//                )
//                .background(.white)
//                .offset(y: isHiddenTabBar ? 50 + reader.safeAreaInsets.bottom : 0)
//                .animation(.easeInOut(duration: 0.5), value: isHiddenTabBar)
                Group {
                    CustomTabBarGenericView(
                        tabs,
                        selectedIndex: Binding(
                            get: {
                                selection.rawValue
                                
                            },
                            set: {
                                selection = TabBarItem(rawValue: $0) ?? .house
                                
                            }),
                        content: { item, isSelected  in
                            VStack {
                                Image(systemName: item.iconName)
                                    .font(.title)
                                Text(item.title)
                                    .font(.footnote)
                            }
                            .foregroundColor(isSelected ? item.color : .gray)
                            .padding(.vertical,8)
                            .frame(maxWidth: .infinity)
                        }
                    )
                }
                .offset(y: isHiddenTabBar ? 50 + reader.safeAreaInsets.bottom : 0)
                .animation(.easeInOut(duration: 0.5), value: isHiddenTabBar)
                
            }
            .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
                self.tabs = value
            })
        }
    }
}

// optional
struct CustomTabBarContainerView_Previews: PreviewProvider {
    static let tabs:[TabBarItem] = TabBarItem.allCases
    
    static var previews: some View {
        ForEach(["iPhone 12", "iPod touch (7th generation)"], id: \.self) { deviceName in
            
            CustomTabBarContainerView(
                selection: .constant(tabs.first!)
            ) {
                Color.red
                    .tabBarItemPresent(tab: tabs.first!, selection: .constant(tabs.first!))
                Color.blue
                    .tabBarItemPresent(tab: tabs[1], selection: .constant(tabs[1]))
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
