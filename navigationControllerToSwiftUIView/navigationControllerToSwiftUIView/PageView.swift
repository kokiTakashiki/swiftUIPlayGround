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
    var body: some View {
        GenericUIViewController(config: config, factory: {
            switch index {
            case .one:
                return PageOneViewController()
            case .two:
                return PageTwoViewController()
            case .three:
                return PageThreeViewController()
            case .four:
                return PageOneViewController()
            case .five:
                return PageTwoViewController()
            case .six:
                return PageThreeViewController()
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
        let viewController = factory()
        config.hostingController?.addChild(viewController)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
