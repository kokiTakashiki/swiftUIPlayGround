//
//  PageView.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/10.
//

import SwiftUI
import UIKit

// 実装が死んでる。
struct PageView: View {
    var id: Int
    var proxy: ScrollViewProxy
    var body: some View {
        GenericUIViewController(factory: {
            switch id {
            case 0:
                return PageOneViewController()
            case 1:
                return PageTowViewController()
            case 2:
                return PageThreeViewController()
            default:
                return UIViewController()
            }
        })
        .frame(minWidth: .infinity, maxHeight: .infinity)
        .tag(id)
        .onAppear {
            withAnimation {
                proxy.scrollTo(id, anchor: .center)
            }
        }
    }
}

//struct PageView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageView()
//    }
//}

struct GenericUIViewController<ViewControllerType>: UIViewControllerRepresentable
where ViewControllerType: UIViewController {
    let factory: () -> ViewControllerType
    
    func makeUIViewController(context: Context) -> ViewControllerType {
        factory()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
