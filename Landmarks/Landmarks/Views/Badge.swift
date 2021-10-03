//
//  Badge.swift
//  Landmarks
//
//  Created by 武田孝騎 on 2021/10/03.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 0))
            .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            badgeSymbols
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
