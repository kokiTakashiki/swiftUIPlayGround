//
//  SegmentedPickerExample.swift
//  PageTabViewStyleTest
//
//  Created by 武田孝騎 on 2022/08/08.
//

import SwiftUI

struct SegmentedPickerExample: View {
    let titles: [String]
    @Binding var selectedIndex: Int

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
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
                        .onAppear {
                            //selectedIndex = 0
                        }
                        .animation(.easeInOut(duration: 0.3))
                }
                .padding(.horizontal, 12)
        }
        .frame(height: 40)
        
    }
}

struct SegmentedPickerExample_Previews: PreviewProvider {
    @State static var selectedInt = 0
    static var previews: some View {
        SegmentedPickerExample(titles: ["Page1","Page2","Page3","Page4","page5"], selectedIndex: $selectedInt)
    }
}
