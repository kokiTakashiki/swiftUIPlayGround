//
//  SegmentedPickerPageView.swift
//  PageTabViewStyleTest
//
//  Created by 武田孝騎 on 2022/08/08.
//

import SwiftUI

struct SegmentedPickerPageView: View {
    let titles: [String]
    @State var selectedIndex: Int

    var body: some View {
        VStack {
            SegmentedPicker(
                titles,
                selectedIndex: Binding(
                    get: { selectedIndex },
                    set: { selectedIndex = $0 }),
                selectionAlignment: .bottom,
                content: { item, isSelected in
                    Text(item)
                        .foregroundColor(isSelected ? Color.black : Color.gray )
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                },
                selection: {
                    VStack(spacing: 0) {
                        Spacer()
                        Color.black.frame(height: 1)
                    }
                })
//                .onAppear {
//                    selectedIndex =
//                }
                .animation(.easeInOut(duration: 0.3))
            TabView(selection: $selectedIndex) {
                Text("Page 1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
                    .tag(0)
                Text("Page 2")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green)
                    .tag(1)
                Text("Page 3")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
        }
    }
}

struct SegmentedPickerPageView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPickerPageView(titles: ["A","B","C"], selectedIndex: 0)
    }
}
