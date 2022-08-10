//
//  PageOneView.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/10.
//

import SwiftUI
import UIKit

struct PageOneView: View {
    var id: Int
    var proxy: ScrollViewProxy
    var body: some View {
        PageOneViewControllerWapper()
    }
}

//struct PageView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageView()
//    }
//}

struct PageOneViewControllerWapper: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> PageOneViewController {
        PageOneViewController()
    }
    
    func updateUIViewController(_ uiViewController: PageOneViewController, context: Context) {}
}
