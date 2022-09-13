//
//  ContentViewTab.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/10.
//

import SwiftUI

struct ContentViewTab: View {
    
    let item: TabBarItem
    var isSelected: Bool
    
    var body: some View {
        Label {
            Text(item.title)
        } icon: {
            if isSelected {
                LinearGradient(
                    colors: [.red, .blue, .green, .yellow],
                    startPoint: .init(x: 0, y: 0),
                    endPoint: .init(x: 1.0, y: 1.0)
                )
                .mask(
                    Image(systemName: item.selectedIconName )
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
            } else {
                Image(systemName: item.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .labelStyle(.verticalStyle)
        .foregroundColor(isSelected ? item.color : .gray)
        .padding(.vertical,8)
        .frame(maxWidth: .infinity)
    }
}

struct ContentViewTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTab(item: .house, isSelected: true)
            .previewLayout(.fixed(width: 50, height: 50))
            
    }
}

struct VerticalStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 0) {    // << here !!
            configuration.icon
                .frame(height: 27)
            configuration.title
                .font(.footnote)
        }
    }
}

extension LabelStyle where Self == VerticalStyle {
    static var verticalStyle: VerticalStyle {
        .init()
    }
}
