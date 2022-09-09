//
//  TabBarItem.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/08.
//

import SwiftUI
import UIKit

enum TabBarItem: Hashable, CaseIterable {
    case house, car, person, message, phone, ring
    
//    var tabBarItem: UITabBarItem {
//        switch self {
//        case .house: return UITabBarItem(title: self.title, image: UIImage(systemName: self.iconName), tag: 0)
//        case .car: return UITabBarItem(title: self.title, image: UIImage(systemName: self.iconName), tag: 1)
//        case .person: return UITabBarItem(title: self.title, image: UIImage(systemName: self.iconName), tag: 2)
//        }
//    }
    
    var iconName:String {
        switch self {
        case .house: return "house"
        case .car: return "car"
        case .person: return "person"
        case .message: return "message"
        case .phone: return "phone"
        case .ring: return "ring"
        }
    }
    
    var title:String {
        switch self {
        case .house: return "house"
        case .car: return "car"
        case .person: return "person"
        case .message: return "message"
        case .phone: return "phone"
        case .ring: return "ring"
        }
    }
    
    var color:Color {
        switch self {
        case .house: return .blue
        case .car: return .blue
        case .person: return .blue
        case .message: return .blue
        case .phone: return .blue
        case .ring: return .blue
        }
    }
    
}
