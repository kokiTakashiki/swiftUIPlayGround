//
//  SegmentPickerPageView.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/10.
//

import SwiftUI

struct SegmentPickerPageView: View {
    //@State private var selection = 0
    @State private var selectionIndex:PageIndex = .one
    
    var body: some View {
        ScrollViewReader { scrollView in
            VStack(spacing: 5) {
                SegmentedPickerExample(titles: ["Page1","Page2","Page3"], selectedIndex: $selectionIndex)
//                Picker("", selection: $selectionIndex) {
//                    Text("Page1").tag(PageIndex.one)
//                    Text("Page2").tag(PageIndex.two)
//                    Text("Page3").tag(PageIndex.three)
//                }.pickerStyle(SegmentedPickerStyle())
                
                TabView(selection: $selectionIndex) {
                    PageView(index: .one, proxy: scrollView)
                    PageView(index: .two, proxy: scrollView)
                    PageView(index: .three, proxy: scrollView)
//                    PageOneView(id: 0, proxy: scrollView)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .background(Color.green)
//                        .tag(0)
//                        .onAppear{
//                            withAnimation {
//                                scrollView.scrollTo(0, anchor: .center)
//                            }
//                        }
//                    Text("Page 2")
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .background(Color.green)
//                        .tag(1)
//                        .onAppear{
//                            withAnimation {
//                                scrollView.scrollTo(1, anchor: .center)
//                            }
//                        }
//                    Text("Page 3")
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .background(Color.blue)
//                        .tag(2)
//                        .onAppear{
//                            withAnimation {
//                                scrollView.scrollTo(2, anchor: .center)
//                            }
//                        }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
        }
    }
}

struct SegmentPickerPageView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentPickerPageView()
    }
}
