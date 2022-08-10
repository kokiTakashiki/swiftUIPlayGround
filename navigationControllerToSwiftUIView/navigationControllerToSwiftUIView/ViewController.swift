//
//  ViewController.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/10.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "test navigation"
        
        let vc: UIHostingController = UIHostingController(rootView: SegmentPickerPageView())
        //let vc = PageOneViewController()
        self.addChild(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)

        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.heightAnchor.constraint(equalToConstant: 320).isActive = true
        vc.view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        vc.view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        vc.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }


}

