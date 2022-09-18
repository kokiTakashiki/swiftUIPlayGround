//
//  ContentView.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/09.
//

import SwiftUI

struct ContentView: View {
    //@State var isHiddenTabBar: Bool = false
    @State var selectionItem: TabBarItem = .house
    @State var scrollOffset: CGPoint = .zero
    
    @EnvironmentObject var viewModel: ListViewModel
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                HideableTabBarView
                    .hiddenTabBar(is: viewModel.isHiddenTabBar)
                
                button
                    .position(x: reader.size.width - 20, y: reader.size.height - 80)
            }
        }

    }
}

//
// HideableTabBarView
//
extension ContentView {
    
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
            SubContentView()
                .transition(.identity)
        case .car:
            InifiniteListTest().environmentObject(viewModel)
                .transition(.identity)
        case .person:
            VStack {
                ObservableScrollView {
                    Text("Hello, world!")
                        .foregroundColor(self.scrollOffset.y == 0 ? .blue : .red)
                }
                .onScroll {
                    self.scrollOffset = $0
                    print($0)
                    if $0.y != 0 {
                        viewModel.isHiddenTabBar = $0.y > 0 ? true : false
                    }
                }
            }
            .transition(.identity)
        case .message:
            ObservableInfiniteListView()
                .onScroll {
                    print($0)
                    if $0.y != 0 {
                        viewModel.isHiddenTabBar = $0.y > 0 ? true : false
                    }
                }
                .environmentObject(viewModel)
                .transition(.identity)
        case .phone:
            MatrixView()
                .transition(.identity)
        case .ring:
            SafariTabBar()
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
extension ContentView {
    
    private func testView(text: String, bg: Color) -> some View {
        ZStack {
            bg
            Text(text)
        }
    }
    
    private var button: some View {
        Button {
            viewModel.isHiddenTabBar.toggle()
        } label: {
            buttonIcon
        }
    }
    
    private var buttonIcon: some View {
        Image(systemName: viewModel.isHiddenTabBar ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
            .font(.system(size: 20))
            .frame(width: 44, height: 44)
            .contentShape(Rectangle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12", "iPod touch (7th generation)"], id: \.self) { deviceName in
            ContentView().environmentObject(ListViewModel())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
