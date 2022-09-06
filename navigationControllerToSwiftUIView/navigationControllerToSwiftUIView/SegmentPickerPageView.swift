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
    //@State private var selectionIndex:PageIndex = .one
    @EnvironmentObject var model:SegmentPickerPageViewModel
    let config:Configuration
    
    var body: some View {
        ScrollViewReader { scrollView in
            VStack(spacing: 5) {
                SegmentedPickerExample(index: PageIndex.allCases.map { $0 })
                    .environmentObject(model)
//                Picker("", selection: $selectionIndex) {
//                    Text("Page1").tag(PageIndex.one)
//                    Text("Page2").tag(PageIndex.two)
//                    Text("Page3").tag(PageIndex.three)
//                }.pickerStyle(SegmentedPickerStyle())
                
                TabView(selection: $model.state.selectionIndex) {
                    PageView(index: .one,
                             config: config)
                    PageView(index: .two,
                             config: config)
                    PageView(index: .three,
                             config: config)
                    PageView(index: .four,
                             config: config)
                    PageView(index: .five,
                             config: config)
                    PageView(index: .six,
                             config: config)
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
                .onChange(of: model.state.selectionIndex) { index in
                    withAnimation {
                        if #available(iOS 15.0, *) {
                            scrollView.scrollTo(index.rawValue, anchor: .center)
                        } else {
                            if index == .five {
                                scrollView.scrollTo(index.rawValue, anchor: nil)
                            } else if index == .six {
                                scrollView.scrollTo(index.rawValue, anchor: .trailing)
                            }
                        }
                        
                    }
                }
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
