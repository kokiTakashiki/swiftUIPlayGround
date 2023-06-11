//
//  iOS14SupportDismissKey.swift
//  PopUIViewControllerTest
//
//  Created by 武田孝騎 on 2023/06/10.
//

import SwiftUI
import UIKit

//extension EnvironmentValues {
//    // this can be used as: @Environment(\.dismissable) var myDismiss
//    // in any swiftui view and it will not complain about ios versions
//    var dismissable: () -> Void {
//        return dismissAction
//    }
//
//
//    // this function abstracts the availability check so you can
//    // avoid the conflicting return types and any other headache
//    private func dismissAction() {
//        if #available(iOS 15, *) {
//            dismiss()
//        } else {
//            presentationMode.wrappedValue.dismiss()
//        }
//    }
//}

struct CustomDismissAction {
    private var parentViewController: UIViewController
    
    func callAsFunction(animated: Bool = true) {
        parentViewController.dismiss(animated: animated)
    }

    init(_ parentViewController: UIViewController = UIViewController()) {
        self.parentViewController = parentViewController
    }
}

struct CustomDismissActionKey: EnvironmentKey {
    static let defaultValue: CustomDismissAction = CustomDismissAction()
}

extension EnvironmentValues {
    var customDismiss: CustomDismissAction {
        get {
            self[CustomDismissActionKey.self]
        }
        set {
            self[CustomDismissActionKey.self] = newValue
        }
    }
}

extension View {
    func setupDismissAction(_ parentViewController: UIViewController) -> some View {
        environment(\.customDismiss, CustomDismissAction(parentViewController))
    }
}
