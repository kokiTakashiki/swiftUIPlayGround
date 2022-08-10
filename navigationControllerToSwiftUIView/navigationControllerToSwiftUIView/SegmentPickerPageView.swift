//
//  SegmentPickerPageView.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/10.
//

import SwiftUI

struct SegmentPickerPageView: View {
    @State private var selection = 0
    
    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                SegmentedPickerExample(titles: ["Page1","Page2","Page3"], selectedIndex: $selection)
                
                TabView(selection: $selection) {
//                    PageView(id: 0, proxy: scrollView)
//                    PageView(id: 1, proxy: scrollView)
//                    PageView(id: 2, proxy: scrollView)
                    PageOneView(id: 0, proxy: scrollView)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.green)
                        .tag(0)
                        .onAppear{
                            withAnimation {
                                scrollView.scrollTo(0, anchor: .center)
                            }
                        }
                    Text("Page 2")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.green)
                        .tag(1)
                        .onAppear{
                            withAnimation {
                                scrollView.scrollTo(1, anchor: .center)
                            }
                        }
                    Text("Page 3")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.blue)
                        .tag(2)
                        .onAppear{
                            withAnimation {
                                scrollView.scrollTo(2, anchor: .center)
                            }
                        }
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
