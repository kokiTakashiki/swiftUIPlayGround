//
//  ContentView.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/09.
//

import SwiftUI

struct ContentView: View {
    @State var isHiddenTabBar: Bool = false
    @State var selectionItem: TabBarItem = .house
    var body: some View {
        GeometryReader { reader in
            ZStack {
                HideableTabBarView(
                    TabBarItem.allCases,
                    selectedIndex: Binding(
                        get: {
                            selectionItem.rawValue
                        },
                        set: {
                            selectionItem = TabBarItem(rawValue: $0) ?? .house
                        }),
                    content: {
                        switchScreens()
                    },
                    tabItem: { item, isSelected  in
                        tabStyle(item, isSelected)
                    })
                    .hiddenTabBar(is: isHiddenTabBar)
                
                Button {
                    isHiddenTabBar.toggle()
                } label: {
                    buttonIcon()
                }
                .position(x: reader.size.width - 20, y: reader.size.height - 70)
            }
        }

    }
}

//
// Views
//
extension ContentView {
    private func testView(text: String, bg: Color) -> some View {
        ZStack {
            bg
            Text(text)
        }
    }
    
    private func buttonIcon() -> some View {
        Image(systemName: isHiddenTabBar ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
            .font(.system(size: 20))
            .frame(width: 44, height: 44)
            .contentShape(Rectangle())
    }
    
    @ViewBuilder
    private func switchScreens() -> some View {
        switch selectionItem {
        case .house:
            testView(text: TabBarItem.house.title, bg: .red)
                .transition(.identity)
        case .car:
            testView(text: TabBarItem.car.title, bg: .yellow)
                .transition(.identity)
        case .person:
            testView(text: TabBarItem.person.title, bg: .green)
                .transition(.identity)
        case .message:
            testView(text: TabBarItem.message.title, bg: .purple)
                .transition(.identity)
        case .phone:
            MatrixView()
                .transition(.identity)
        case .ring:
            testView(text: TabBarItem.ring.title, bg: .gray)
                .transition(.identity)
        }
    }
    
    private func tabStyle(_ item: TabBarItem, _ isSelected: Bool) -> some View {
        VStack(spacing:0) {
            if isSelected {
                LinearGradient(
                    colors: [.red, .blue, .green, .yellow],
                    startPoint: .init(x: 0, y: 0),
                    endPoint: .init(x: 1.0, y: 1.0)
                )
                .mask(
                    Image(systemName: item.selectedIconName )
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
                .frame(height: 30)
            } else {
                Image(systemName: item.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
            }
            Text(item.title)
                .font(.footnote)
        }
        .foregroundColor(isSelected ? item.color : .gray)
        .padding(.vertical,8)
        .frame(maxWidth: .infinity)
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
