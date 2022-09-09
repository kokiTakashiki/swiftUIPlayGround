//
//  TabContentContainerView.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/08.
//

import SwiftUI

struct TabContentContainerView<TabContent>: View {
    
    private let tabContents: [AnyView]
    @State private var tabs: [TabBarItem] = []//TabBarItem.allCases
    var tabsMaxCount: Int
    
    @Binding var selection: Int
    
    init(
        selection: Binding<Int>,
        tabsMaxCount: Int,
        @ViewBuilder tabContent: @escaping () -> TupleView<TabContent>
    ) {
        self._selection = selection
        self.tabsMaxCount = tabsMaxCount
        self.tabContents = tabContent().getViews
    }

    var body: some View {
        VStack {
            TabContentView(
                selection: $selection,
                tabs: tabs,
                tabsMaxCount: tabsMaxCount,
                tabContents: tabContents
            )
        }
//        .onPreferenceChange(UITabBarItemsPreferenceKey.self, perform: { value in
//            self.tabs += value
//        })
    }
}

extension TupleView {
    var getViews: [AnyView] {
        makeArray(from: value)
    }
    
    private struct GenericView {
        let body: Any
        
        var anyView: AnyView? {
            AnyView(_fromValue: body)
        }
    }
    
    private func makeArray<Tuple>(from tuple: Tuple) -> [AnyView] {
        func convert(child: Mirror.Child) -> AnyView? {
            withUnsafeBytes(of: child.value) { ptr -> AnyView? in
                let binded = ptr.bindMemory(to: GenericView.self)
                return binded.first?.anyView
            }
        }
        
        let tupleMirror = Mirror(reflecting: tuple)
        return tupleMirror.children.compactMap(convert)
    }
}
