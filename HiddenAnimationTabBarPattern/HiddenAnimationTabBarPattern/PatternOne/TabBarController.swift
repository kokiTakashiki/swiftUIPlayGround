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
    var titles: [String?]
    var icons: [String]
    
    
    @Binding var currentTab: Int
    
    @Binding var isHiddenTabBar: Bool
    internal var constTabBarFrame: CGRect = CGRect()

    func makeUIViewController(context: Context) -> UITabBarController {
        //let tabViewManager = TabViewManager()
        let controller = UITabBarController()

        let contents:[UIViewController] = tabContents.enumerated().reduce(into: []) { contents, tab in
            let content = UIHostingController(rootView: tab.element)
            content.tabBarItem = UITabBarItem(title: titles[tab.offset], image: UIImage(systemName: icons[tab.offset]), tag: tab.offset)
            contents.append(content)
        }
        
//        let vc1 = UIHostingController(rootView: FirstView().environmentObject(tabViewManager))
//        vc1.tabBarItem = UITabBarItem(title: "tab1", image: UIImage(systemName: "house"), tag: 1)
//
//        let vc2 = UIHostingController(rootView: SecondView().environmentObject(tabViewManager))
//        vc2.tabBarItem = UITabBarItem(title: "tab2", image: UIImage(systemName: "car"), tag: 2)

//        let vcs = [vc1, vc2]
        controller.setViewControllers(contents, animated: true)
        controller.tabBar.frame = constTabBarFrame
        controller.tabBar.backgroundColor = .green
        return controller
    }

    func updateUIViewController(_ tabBarController: UITabBarController, context: Context) {
        
        hiddenAnimation(
            tabBar: tabBarController.tabBar,
            safeAreaBottom: tabBarController.view.safeAreaInsets.bottom,
            visible: isHiddenTabBar
        )
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
