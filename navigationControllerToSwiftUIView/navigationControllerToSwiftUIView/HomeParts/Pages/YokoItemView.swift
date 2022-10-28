//
//  YokoItemView.swift
//  PageTabViewStyleTest
//
//  Created by 武田孝騎 on 2022/08/08.
//

import SwiftUI

struct YokoItemView: View {
    @EnvironmentObject var model:SegmentPickerPageViewModel
    var body: some View {
        VStack {
            ItemList(items: (0..<100).map { ItemData(index: $0) })
                .frame(height: 100)
                .environmentObject(model)
            ItemList(items: (500..<600).map { ItemData(index: $0) })
                .environmentObject(model)
            ItemList(items: (1000..<1100).map { ItemData(index: $0) })
                .environmentObject(model)
        }
    }
}

struct ItemData {
    var index = 0
    var check = false
}

struct ItemList: View {
    @EnvironmentObject var model:SegmentPickerPageViewModel
    @State var items: [ItemData]

    var body: some View {
        GeometryReader { geo in
            List(0..<items.count) { i in
                ItemRow(item: $items[i])
                    .frame(height: 100)
                    .contentShape(Rectangle())
                    .gesture(DragGesture()
                        .onChanged({ value in
                            model.state.isDrag = false
                            print("false")
                        })
                        .onEnded({ value in
                            model.state.isDrag = true
                            print("true")
                        })
                    )
            }
            .frame(width: geo.size.height, height: geo.size.width)
            .rotationEffect(.degrees(-90), anchor: .bottomLeading)
            .transformEffect(.init(translationX: geo.size.width, y: 0))
            .scaleEffect(x: 1, y: -1)
            
        }
    }
}

struct ItemRow: View {
    @Binding var item: ItemData

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.blue.opacity(item.check ? 0.5 : 0.3)
                    .cornerRadius(8)
                Text("\(item.index)")
            }
            .frame(width: geo.size.height, height: geo.size.width)
            .rotationEffect(.degrees(90), anchor: .topTrailing)
            .transformEffect(.init(translationX: 0, y: geo.size.height))
            .scaleEffect(x: -1, y: 1)
            .onTapGesture {
                item.check.toggle()
            }
        }
    }
}

struct YokoItemView_Previews: PreviewProvider {
    @State static var model = SegmentPickerPageViewModel()
    static var previews: some View {
        YokoItemView()
            .environmentObject(model)
    }
}
