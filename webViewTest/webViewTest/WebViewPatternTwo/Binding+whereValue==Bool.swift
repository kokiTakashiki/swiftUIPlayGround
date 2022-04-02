//
//  Binding+whereValue==Bool.swift
//  webViewTest
//
//  Created by 武田孝騎 on 2022/04/02.
//

import SwiftUI

extension Binding where Value == Bool {
    static prefix func !(_ lhs: Binding<Bool>) -> Binding<Bool> {
        return Binding<Bool>(get:{ !lhs.wrappedValue },
                             set: { lhs.wrappedValue = !$0})
    }
}
