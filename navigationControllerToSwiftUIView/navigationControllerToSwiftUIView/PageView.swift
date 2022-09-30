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
    let config: Configuration
    let model: SegmentPickerPageViewModel
    var body: some View {
        GenericUIViewController(config: config, factory: {
            switch index {
            case .one:
                let vc = PageOneViewController()
                vc.viewModel = model
                return vc
            case .two:
                let vc = PageTwoViewController()
                vc.viewModel = model
                return vc
            case .three:
                let vc = PageThreeViewController()
                vc.viewModel = model
                return vc
            case .four:
                let vc = PageFourViewController()
                vc.viewModel = model
                return vc
            case .five:
                let vc = PageFiveViewController()
                vc.viewModel = model
                return vc
            case .six:
                let vc = PageSixViewController()
                vc.viewModel = model
                return vc
            }
        })
        //.frame(minWidth: .infinity, maxHeight: .infinity)
        .tag(index)
    }
}

struct GenericUIViewController<ViewControllerType: UIViewController>: UIViewControllerRepresentable {
    let config: Configuration
    let factory: () -> ViewControllerType
    
    func makeUIViewController(context: Context) -> ViewControllerType {
        print("makeUIViewController")
        let viewController = factory()
        config.hostingController?.addChild(viewController)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print("updateUIViewController")
    }
}
