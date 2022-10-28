//
//  PageView.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/10.
//

import SwiftUI
import UIKit

struct PageView: View {
    var index: PageIndex
    let config: SegmentPickerPageViewConfiguration
    let model: SegmentPickerPageViewModel
    var body: some View {
        GenericUIViewController(factory: {
            switch index {
            case .one:
                let vc = PageOneViewController()
                vc.viewModel = model
                config.hostingController?.addChild(vc)
                return vc
            case .two:
                let vc = PageTwoViewController()
                config.hostingController?.addChild(vc)
                vc.viewModel = model
                return vc
            case .three:
                let vc = PageThreeViewController()
                config.hostingController?.addChild(vc)
                vc.viewModel = model
                return vc
            case .four:
                let vc = PageFourViewController()
                config.hostingController?.addChild(vc)
                vc.viewModel = model
                return vc
            case .five:
                let vc = PageFiveViewController()
                config.hostingController?.addChild(vc)
                vc.viewModel = model
                return vc
            case .six:
                let vc = PageSixViewController()
                config.hostingController?.addChild(vc)
                vc.viewModel = model
                return vc
            }
        })
        .gesture(TapGesture())
        //.frame(minWidth: .infinity, maxHeight: .infinity)
        .tag(index)
    }
}

struct GenericUIViewController<ViewControllerType: UIViewController>: UIViewControllerRepresentable {
    let factory: () -> ViewControllerType
    
    func makeUIViewController(context: Context) -> ViewControllerType {
        print("makeUIViewController")
        return factory()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print("updateUIViewController")
    }
}
