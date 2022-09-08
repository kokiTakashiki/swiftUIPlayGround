//
//  CustomTabBarView.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/08.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabBar(item: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
    }
}

extension CustomTabBarView {
    private func tabBar(item: TabBarItem) -> some View {
        VStack {
            Image(systemName: item.iconName)
                .font(.title)
            Text(item.title)
                .font(.footnote)
        }
        .foregroundColor(selection == item ? item.color : .gray)
        .padding(.vertical,8)
        .frame(maxWidth: .infinity)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeOut) {
            selection = tab
        }
    }
}

// optional
struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs:[TabBarItem] = TabBarItem.allCases
    
    static var previews: some View {
        ForEach(["iPhone 12", "iPod touch (7th generation)"], id: \.self) { deviceName in
            
            VStack {
                Spacer()
                CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
                    .background(.green)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
