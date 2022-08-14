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
    var proxy: ScrollViewProxy
    var body: some View {
        GenericUIViewController(factory: {
            switch index {
            case .one:
                return PageOneViewController()
            case .two:
                return PageTwoViewController()
            case .three:
                return PageThreeViewController()
            }
        })
        //.frame(minWidth: .infinity, maxHeight: .infinity)
        .tag(index)
        .onAppear {
            withAnimation {
                proxy.scrollTo(index.rawValue, anchor: .center)
            }
        }
    }
}

struct GenericUIViewController<ViewControllerType: UIViewController>: UIViewControllerRepresentable {
    let factory: () -> ViewControllerType
    
    func makeUIViewController(context: Context) -> ViewControllerType {
        factory()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
