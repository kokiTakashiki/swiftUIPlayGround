//
//  TabBarItem.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/09.
//

import SwiftUI

enum TabBarItem: Int, CaseIterable, Identifiable {
    
    var id: String { UUID().uuidString }
    
    case house, car, person, message, phone, ring
    
    var iconName:String {
        switch self {
        case .house: return "house"
        case .car: return "car"
        case .person: return "person"
        case .message: return "message"
        case .phone: return "phone"
        case .ring: return "pencil.circle"
        }
    }
    
    var selectedIconName: String {
        switch self {
        case .house: return "house.fill"
        case .car: return "car.fill"
        case .person: return "person.fill"
        case .message: return "message.fill"
        case .phone: return "phone.fill"
        case .ring: return "pencil.circle.fill"
        }
    }
    
    var title:String {
        switch self {
        case .house: return "house"
        case .car: return "car"
        case .person: return "person"
        case .message: return "message"
        case .phone: return "phone"
        case .ring: return "pencil"
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
