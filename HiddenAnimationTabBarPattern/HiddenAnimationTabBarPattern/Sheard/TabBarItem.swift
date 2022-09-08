//
//  TabBarItem.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/08.
//

import SwiftUI

enum TabBarItem: Hashable, CaseIterable {
    case house, car, person
    
    var iconName:String {
        switch self {
        case .house: return "house"
        case .car: return "car"
        case .person: return "person"
        }
    }
    
    var title:String {
        switch self {
        case .house: return "house"
        case .car: return "car"
        case .person: return "person"
        }
    }
    
    var color:Color {
        switch self {
        case .house: return .blue
        case .car: return .blue
        case .person: return .blue
        }
    }
    
}
