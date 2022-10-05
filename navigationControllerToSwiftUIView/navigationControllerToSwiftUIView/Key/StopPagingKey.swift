//
//  StopPagingKey.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/10/04.
//

import SwiftUI

struct StopPagingKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var stopPaging: Bool {
        get { self[StopPagingKey.self] }
        set { self[StopPagingKey.self] = newValue }
    }
}
