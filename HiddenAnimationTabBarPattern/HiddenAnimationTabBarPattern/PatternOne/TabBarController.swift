//
//  ContentView.swift
//  HiddenAnimationTabBarPattern
//
//  Created by 武田孝騎 on 2022/09/07.
//

import SwiftUI
import UIKit

struct TabBarController: UIViewControllerRepresentable {
    var tabContents: [AnyView]
    let tabs: [TabBarItem]
    
    @Binding var currentTab: Int
    
    @Binding var isHiddenTabBar: Bool
    internal var constTabBarFrame: CGRect = CGRect()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UITabBarController {
        
        let controller = UITabBarController()

        let contents:[UIViewController] = tabContents.enumerated().reduce(into: []) { contents, tab in
            let content = UIHostingController(rootView: tab.element)
            content.tabBarItem = UITabBarItem(title: tabs[tab.offset].title, image: UIImage(systemName: tabs[tab.offset].iconName), tag: tab.offset)
            contents.append(content)
        }
        
        controller.setViewControllers(contents, animated: true)
        controller.tabBar.frame = constTabBarFrame
        controller.tabBar.tintColor = .blue
        return controller
    }

    func updateUIViewController(_ tabBarController: UITabBarController, context: Context) {
        
        hiddenAnimation(
            tabBar: tabBarController.tabBar,
            safeAreaBottom: tabBarController.view.safeAreaInsets.bottom,
            visible: isHiddenTabBar
        )
    }
    
    class Coordinator: NSObject, UITabBarControllerDelegate {
        
        var parent: TabBarController

        init(_ tabBarController: TabBarController) {
            parent = tabBarController
        }
        
        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            parent.currentTab = tabBarController.selectedIndex
        }
    }
    
    private func hiddenAnimation(tabBar: UITabBar, safeAreaBottom: CGFloat, visible: Bool) {
        UIView.animate(withDuration: 0.5, animations: {() -> Void in

            var frame = tabBar.frame

            if visible {
                // 隠す（不可視領域に追いやる）
                frame.origin.y = UIScreen.main.bounds.height
                tabBar.frame = frame
            } else {
                // 出す（不可視領域から復帰させる）
                tabBar.isHidden = false
                tabBar.frame = self.constTabBarFrame
            }
        },completion: { _ in
            if visible {
                tabBar.isHidden = true
            } else {
                tabBar.isHidden = false
            }
        })
    }
}
