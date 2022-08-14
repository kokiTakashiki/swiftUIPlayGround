//
//  PageIndex.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/11.
//

enum PageIndex: Int {
    case one
    case two
    case three
    
    var name: String {
        switch self {
            case .one: return "１ページ目"
            case .two: return "２ページ目"
            case .three: return "３ページ目"
        }
    }
}
