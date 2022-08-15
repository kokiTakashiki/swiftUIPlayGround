//
//  SegmentPickerPageView.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/10.
//

import SwiftUI
import UIKit

class Configuration {
    weak var hostingController: UIViewController?
}

struct SegmentPickerPageView: View {
    //@State private var selection = 0
    @State private var selectionIndex:PageIndex = .one
    let config:Configuration
    
    var body: some View {
        ScrollViewReader { scrollView in
            VStack(spacing: 5) {
                SegmentedPickerExample(titles: ["Page1","Page2","Page3","Page4","Page5","Page6"], selectedIndex: $selectionIndex)
//                Picker("", selection: $selectionIndex) {
//                    Text("Page1").tag(PageIndex.one)
//                    Text("Page2").tag(PageIndex.two)
//                    Text("Page3").tag(PageIndex.three)
//                }.pickerStyle(SegmentedPickerStyle())
                
                TabView(selection: $selectionIndex) {
                    PageView(index: .one,
                             proxy: scrollView,
                             config: config, anchor: .center)
                    PageView(index: .two,
                             proxy: scrollView,
                             config: config, anchor: .center)
                    PageView(index: .three,
                             proxy: scrollView,
                             config: config, anchor: .center)
                    PageView(index: .four,
                             proxy: scrollView,
                             config: config, anchor: .center)
                    if #available(iOS 15.0, *) {
                        PageView(index: .five,
                                 proxy: scrollView,
                                 config: config, anchor: .center)
                        PageView(index: .six,
                                 proxy: scrollView,
                                 config: config, anchor: .center)
                    } else {
                        // iOS14のscrollToで最終付近のアイテムにcenterを指定すると空白を作るので個別に対応。
                        PageView(index: .five,
                                 proxy: scrollView,
                                 config: config, anchor: nil)
                        PageView(index: .six,
                                 proxy: scrollView,
                                 config: config, anchor: .trailing)
                    }
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
    static let config = Configuration()
    static var previews: some View {
        Group {
            SegmentPickerPageView(config: config)
                .previewDevice("iPhone 12")
            SegmentPickerPageView(config: config)
                .previewDevice("iPod touch (7th generation)")
        }
    }
}
