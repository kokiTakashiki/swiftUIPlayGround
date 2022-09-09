//
//  CustomTabBarGenericView.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/09.
//

import SwiftUI

struct CustomTabBarGenericView<Element, Content>: View
    where
    Content: View {
    
    typealias Data = [Element]
    private let data: Data
    private let content: (Data.Element, Bool) -> Content
    @Binding private var selectedIndex: Data.Index
    
    init(_ data: Data,
         selectedIndex: Binding<Data.Index>,
         @ViewBuilder content: @escaping (Data.Element, Bool) -> Content
    ) {
        self.data = data
        self.content = content
        self._selectedIndex = selectedIndex
    }
    
    var body: some View {
        HStack {
            ForEach(data.indices, id: \.self) { index in
                content(data[index], selectedIndex == index)
                    .onTapGesture {
                        switchTo(index: index)
                    }
            }
        }
        .frame(height: 50)
        .background(.white)
    }
}

extension CustomTabBarGenericView {
    private func switchTo(index: Int) {
        withAnimation(.easeInOut) {
            selectedIndex = index
        }
    }
}

