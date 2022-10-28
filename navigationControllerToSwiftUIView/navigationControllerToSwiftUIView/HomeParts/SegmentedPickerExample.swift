//
//  SegmentedPickerExample.swift
//  PageTabViewStyleTest
//
//  Created by 武田孝騎 on 2022/08/08.
//

import SwiftUI

struct SegmentedPickerExample: View {
    //let titles: [String]
    let index: [PageIndex]
    //@Binding var selectedIndex: Int
    //@Binding var selectedIndex: PageIndex
    @EnvironmentObject var model:SegmentPickerPageViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            SegmentedPicker(
                index,
                selectedIndex: Binding(
                    get: {
                        model.state.selectionIndex.rawValue
                    },
                    set: {
                        //model.state.selectionIndex = PageIndex(rawValue: $0) ?? .one
                        let new = SegmentPickerPageViewModel.MyState(selectionIndex: PageIndex(rawValue: $0) ?? .one)
                        model.changeState(new: new)
                    }),
                selectionAlignment: .bottom,
                content: { item, isSelected in
                    Text(item.name)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(isSelected ? Color.black : Color.gray )
                        .padding(.horizontal, 18)
                        .padding(.vertical, 18)
                },
                selection: {
                    VStack(spacing: 0) {
                        Spacer()
                        Color.black.frame(height: 2)
                    }
                    .frame(height: 54)
                })
//                        .onAppear {
//                            //selectedIndex = 0
//                        }
                .animation(.easeInOut(duration: 0.3))
        }
        .padding(.horizontal, 12)
        .frame(height: 54)
        
    }
}

struct SegmentedPickerExample_Previews: PreviewProvider {
    //@State static var selectedInt = 0
    //@State static var selectedIndex: PageIndex = .one
    @State static var model = SegmentPickerPageViewModel()
    static var previews: some View {
        SegmentedPickerExample(index: PageIndex.allCases)
            .environmentObject(model)
            .previewLayout(.fixed(width: 375, height: 54))
    }
}
