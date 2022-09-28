//
//  SafariTabBar.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/13.
//

import SwiftUI

struct SafariTabBar: View {
    var body: some View {
        GeometryReader { reader in
            Home(proxy: reader)
        }
    }
}

struct SafariTabBar_Previews: PreviewProvider {
    static var previews: some View {
        SafariTabBar()
    }
}
