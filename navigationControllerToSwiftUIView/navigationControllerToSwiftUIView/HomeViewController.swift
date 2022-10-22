//
//  HomeViewController.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/10/21.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    private let config = SegmentPickerPageViewConfiguration()
    private let model = SegmentPickerPageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "test navigation"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightGray
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        
        let viewController: UIHostingController = UIHostingController(rootView: SegmentPickerPageView(config: config).environmentObject(model))
        config.hostingController = viewController
        self.addChild(viewController)
        self.view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        viewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        viewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        viewController.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}