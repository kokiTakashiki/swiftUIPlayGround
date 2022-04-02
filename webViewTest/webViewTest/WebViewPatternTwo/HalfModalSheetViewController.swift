//
//  HalfModalSheetViewController.swift
//  webViewTest
//
//  Created by 武田孝騎 on 2022/04/02.
//

import SwiftUI

struct HalfModalSheet<Sheet: View>: UIViewControllerRepresentable {
    var sheet: Sheet
    @Binding var isShow: Bool
    var onClose: () -> Void
    
    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(
        _ viewController: UIViewController,
        context: Context
    ) {
        if isShow {
            let sheetController = CustomHostingController(rootView: sheet)
            sheetController.presentationController!.delegate = context.coordinator
            viewController.present(sheetController, animated: true)
        } else {
            viewController.dismiss(animated: true) { onClose() }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    final class CustomHostingController<Content: View>: UIHostingController<Content> {
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let sheet = self.sheetPresentationController {
                sheet.detents = [.medium(),]
                sheet.prefersGrabberVisible = true
            }
        }
    }
    
    final class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        var parent: HalfModalSheet
        
        init(parent: HalfModalSheet) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.isShow = false
        }
    }
}
