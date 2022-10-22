//
//  ContentTabControlView.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/10/21.
//

import SwiftUI
import UIKit

class ContentTabControlViewConfiguration {
    weak var hostingController: UIViewController?
}

struct ContentTabControlView: View {
    @EnvironmentObject var model:ContentTabControlViewModel
    let config:ContentTabControlViewConfiguration
    var body: some View {
        TabView(selection: $model.state.selectionItem) {
            GenericUIViewController(factory: {
                return HomeViewController()
            })
            .tabItem {
                Image(systemName: TabBarItem.house.iconName)
            }
            .tag(TabBarItem.house)
            Color.yellow
                .tabItem {
                    Image(systemName: TabBarItem.car.iconName)
                }
                .tag(TabBarItem.car)
            Color.blue
                .tabItem {
                    Image(systemName: TabBarItem.message.iconName)
                }
                .tag(TabBarItem.message)
            Color.red
                .tabItem {
                    Image(systemName: TabBarItem.person.iconName)
                }
                .tag(TabBarItem.person)
            Color.purple
                .tabItem {
                    Image(systemName: TabBarItem.phone.iconName)
                }
                .tag(TabBarItem.phone)
        }
    }
}

//struct ContentTabControlView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentTabControlView(config: <#ContentTabControlViewConfiguration#>)
//    }
//}
