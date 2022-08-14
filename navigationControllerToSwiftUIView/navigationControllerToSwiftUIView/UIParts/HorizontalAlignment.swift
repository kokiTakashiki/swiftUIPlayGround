//
//  HorizontalAlignment.swift
//  PageTabViewStyleTest
//
//  Created by 武田孝騎 on 2022/08/08.
//

import SwiftUI

extension HorizontalAlignment {
    private enum CenterAlignmentID: AlignmentID {
        static func defaultValue(in dimension: ViewDimensions) -> CGFloat {
            return dimension[HorizontalAlignment.center]
        }
    }
    
    static var horizontalCenterAlignment: HorizontalAlignment {
        HorizontalAlignment(CenterAlignmentID.self)
    }
}
