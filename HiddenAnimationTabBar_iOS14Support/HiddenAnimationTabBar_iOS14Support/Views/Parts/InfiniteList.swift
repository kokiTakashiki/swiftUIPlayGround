//
//  InfiniteList.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/10.
//

import SwiftUI

struct InfiniteList<Data, Content>: View
where Data : RandomAccessCollection, Data.Element : Hashable, Content : View  {
    @Binding var data: Data // 1
    @Binding var isLoading: Bool // 2
    let loadMore: () -> Void // 3
    let content: (Data.Element, Data.Element?, Data.Element?) -> Content // 4
    
    init(data: Binding<Data>,
         isLoading: Binding<Bool>,
         loadMore: @escaping () -> Void,
         @ViewBuilder content: @escaping (Data.Element, Data.Element?, Data.Element?) -> Content) { // 5
        _data = data
        _isLoading = isLoading
        self.loadMore = loadMore
        self.content = content
    }
    
    var body: some View {
        List {
            ForEach(data, id: \.self) { item in
                content(item, data.first, data.last) // 最初・最後のアイテムさえ渡せればいい。
                    .onAppear {
                        if item == data.last { // 6
                            loadMore()
                        }
                    }
            }
            if isLoading { // 7
                ProgressView()
                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
            }
        }
        .onAppear(perform: loadMore) // 8
    }
}

extension InfiniteList {
    func onScroll(_ onScroll: @escaping (CGPoint) -> ()) -> some View {
        self.onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: onScroll)
    }
}
