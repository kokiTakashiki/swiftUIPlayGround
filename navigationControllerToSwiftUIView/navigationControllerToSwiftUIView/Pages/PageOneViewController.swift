//
//  PageOneViewController.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/10.
//

import UIKit

class PageOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .orange
        
        
        
        self.navigationController?.pushViewController(PageThreeViewController(), animated: true)
    }


}
