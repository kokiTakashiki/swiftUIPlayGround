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
    var tabs: [UITabBarItem]
    let tabsMaxCount: Int
    
    @Binding var currentTab: Int
    @Environment(\.isHiddenTabBar) var isHiddenTabBar: Bool
    
    @State private var constTabBarFrame: CGRect = CGRect()
    @Binding var isSetupComplete: Bool // TODO: 用意したくなかったがもうこれ以上初期化の判定を考慮できなかったので無念のフラグ
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UITabBarController {
        
        let controller = UITabBarController()
        
        let contents:[UIViewController] = tabContents.enumerated().reduce(into: []) { contents, tab in
            let content = UIHostingController(rootView: tab.element)
            contents.append(content)
        }
        
        controller.setViewControllers(contents, animated: true)
        controller.tabBar.backgroundColor = .green
        
        return controller
    }

    func updateUIViewController(_ tabBarController: UITabBarController, context: Context) {
        
        if isSetupComplete {
            hiddenAnimation(
                tabBar: tabBarController.tabBar,
                safeAreaBottom: tabBarController.view.safeAreaInsets.bottom,
                visible: isHiddenTabBar
            )
        } else {
            if tabs.isEmpty {
                // 初期化処理を通す。通さないとtabが生成されないため。
                // ここで初期化対象を減らしても、uiTabBarItemは呼ばれた画面分再度実行されるので、tabsのfirstIndexの除去はやることになるので削らない。
                for vc in tabBarController.viewControllers! {
                    vc.viewDidAppear(true)
                }
            }
            
            if !tabs.isEmpty {
                // 最初の画面は表示済みのため。UITabBarItemsPreferenceKeyを更新してしまう。
                // そして初期化処理によって再表示されUITabBarItemsPreferenceKeyを更新されることで、tabsが[First,First,Second,...,end]となり増えてしまうので除去。
                var localTabs = tabs
                localTabs.removeFirst()
                if !(tabsMaxCount == localTabs.count) { return }
                localTabs.forEach { tab in
                    tabBarController.viewControllers?[tab.tag].tabBarItem = tab
                }
                tabBarController.tabBar.tintColor = .blue
            }
        }
        
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
//                frame.origin.y = UIScreen.main.bounds.height
//                tabBar.frame = frame
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
