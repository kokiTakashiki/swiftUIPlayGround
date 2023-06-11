//
//  SwiftUIViewModel.swift
//  PopUIViewControllerTest
//
//  Created by 武田孝騎 on 2023/06/10.
//

import SwiftUI
import Combine

final class SwiftUIViewModel: ObservableObject {
    // iOS 15.0 からDismiss keyでいける。
    // iOS 14.0でも実装はできるが親のViewControllerごと閉じれるのはiOS 15.0からなので、これしかない。
    let dismissSubscription = PassthroughSubject<Void, Never>()
    
    func dismissAction() {
        dismissSubscription.send()
    }
}
