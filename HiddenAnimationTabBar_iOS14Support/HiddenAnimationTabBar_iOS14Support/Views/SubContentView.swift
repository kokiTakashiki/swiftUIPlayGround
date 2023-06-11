//
//  SubContentView.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/10.
//

import SwiftUI

struct SubContentView: View {
    @State var isHiddenTabBar: Bool = false
    @State var selectionItem: TabBarItem = .house
    var body: some View {
        GeometryReader { reader in
            ZStack {
                HideableTabBarView
                    .hiddenTabBar(is: isHiddenTabBar)
                
                button
                    .position(x: reader.size.width - 20, y: reader.size.height - 80)
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
                
                Rectangle()
                    .fill(Color.white)
                    .shadow(color: .gray, radius: 3, x: 10, y: 10)
                    .frame(height: 24)
            }
        }

    }
}

//
// HideableTabBarView
//
extension SubContentView {
    
    private var HideableTabBarView: some View {
        HiddenAnimationTabBar_iOS14Support
            .HideableTabBarView(
                TabBarItem.allCases,
                selectedIndex: selectedIndex,
                content: {
                    switchScreens()
                },
                tabItem: { item, isSelected  in
                    ContentViewTab(item: item, isSelected: isSelected)
                })
    }
    
    private var selectedIndex: Binding<Int> {
        Binding(
            get: {
                selectionItem.rawValue
            },
            set: {
                selectionItem = TabBarItem(rawValue: $0) ?? .house
            }
        )
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
}

fileprivate extension View {
    func hiddenTabBar(is: Bool) -> some View {
        environment(\.isHiddenTabBar, `is`)
    }
}

//
// Views
//
extension SubContentView {
    
    private func testView(text: String, bg: Color) -> some View {
        ZStack {
            bg
            Text(text)
        }
    }
    
    private var button: some View {
        Button {
            isHiddenTabBar.toggle()
        } label: {
            buttonIcon
        }
    }
    
    private var buttonIcon: some View {
        Image(systemName: isHiddenTabBar ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
            .font(.system(size: 20))
            .frame(width: 44, height: 44)
            .contentShape(Rectangle())
    }
}

struct SubContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12", "iPod touch (7th generation)"], id: \.self) { deviceName in
            SubContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
