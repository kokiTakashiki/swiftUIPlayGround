//
//  ContentView.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/07.
//

import SwiftUI

struct TabContentView<TabContent>: View {
    
    private let tabContents: [AnyView]
    
    @Binding var selection: Int
    @Binding var isHiddenTabBar: Bool
    
    init(
        selection: Binding<Int>,
        isHiddenTabBar: Binding<Bool>,
        @ViewBuilder tabContent: @escaping () -> TupleView<TabContent>
    ) {
        self._selection = selection
        self._isHiddenTabBar = isHiddenTabBar
        self.tabContents = tabContent().getViews
    }

    var body: some View {
        TabBarController(tabContents: tabContents,
                         titles: ["a","b"],
                         icons: ["house","car"],
                         currentTab: $selection,
                         isHiddenTabBar: $isHiddenTabBar)
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
