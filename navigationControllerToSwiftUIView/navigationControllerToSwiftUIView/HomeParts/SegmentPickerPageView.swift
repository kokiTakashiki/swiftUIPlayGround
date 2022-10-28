//
//  SegmentPickerPageView.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/10.
//

import SwiftUI
import UIKit

class SegmentPickerPageViewConfiguration {
    weak var hostingController: UIViewController?
}

struct SegmentPickerPageView: View {
    //@State private var selection = 0
    //@State private var selectionIndex:PageIndex = .one
    @EnvironmentObject var model:SegmentPickerPageViewModel
    let config:SegmentPickerPageViewConfiguration
    
    var body: some View {
        ScrollViewReader { scrollView in
            VStack(spacing: 5) {
                SegmentedPickerExample(index: PageIndex.allCases.map { $0 })
                    .environmentObject(model)
                
//                TabView(selection: $model.state.selectionIndex) {
//                    PageView(index: .one,
//                             config: config, model: model)
//                    PageView(index: .two,
//                             config: config, model: model)
//                    PageView(index: .three,
//                             config: config, model: model)
//                    PageView(index: .four,
//                             config: config, model: model)
//                    PageView(index: .five,
//                             config: config, model: model)
//                    PageView(index: .six,
//                             config: config, model: model)
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                PagerView(index: Binding(
                    get: {
                        model.state.selectionIndex.rawValue
                    },
                    set: {
                        //model.state.selectionIndex = PageIndex(rawValue: $0) ?? .one
                        let new = SegmentPickerPageViewModel.MyState(selectionIndex: PageIndex(rawValue: $0) ?? .one)
                        model.changeState(new: new)
                    }),
                endIndex: 6) {
                    PageView(index: .one,
                             config: config, model: model)
                    PageView(index: .two,
                             config: config, model: model)
                    PageView(index: .three,
                             config: config, model: model)
                    PageView(index: .four,
                             config: config, model: model)
                    PageView(index: .five,
                             config: config, model: model)
                    YokoItemView()
                        
                        .environmentObject(model)
                }
                .stopPaging(is: model.state.isDrag)
                .onChange(of: model.state.selectionIndex) { index in
                    withAnimation {
                        if #available(iOS 15.4, *) {
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

fileprivate extension View {
    func stopPaging(is: Bool) -> some View {
        environment(\.stopPaging, `is`)
    }
}

//struct SegmentPickerPageView_Previews: PreviewProvider {
//    static let config = SegmentPickerPageViewConfiguration()
//    static var previews: some View {
//        Group {
//            SegmentPickerPageView(config: config)
//                .previewDevice("iPhone 12")
//            SegmentPickerPageView(config: config)
//                .previewDevice("iPod touch (7th generation)")
//        }
//    }
//}
