//
//  PageThreeViewController.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/10.
//

import UIKit

class PageThreeViewController: UIViewController {

    // 画面のタイトル用ラベル
    private let titleLabel = UILabel()
    // ボタンのインスタンス生成
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
        // スクリーンの横縦幅
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height
        
        titleLabel.frame = CGRect(x:0, y:0,
                                  width:screenWidth/2, height:50)
        titleLabel.text = PageIndex.three.name
        self.view.addSubview(titleLabel)
        
        // ボタンの位置とサイズを設定
        button.frame = CGRect(x:screenWidth/4, y:screenHeight/2,
                       width:screenWidth/2, height:50)
        // ボタンのタイトルを設定
        button.setTitle("Tap me!", for:UIControl.State.normal)
        
        // タイトルの色
        button.setTitleColor(UIColor.blue, for: .normal)
        
        // ボタンのフォントサイズ
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 36)
        
        // 背景色
        button.backgroundColor = UIColor.init(
                                 red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        // タップされたときのaction
        button.addTarget(self,
               action: #selector(self.buttonTapped(sender:)),
               for: .touchUpInside)
        
        // Viewにボタンを追加
        self.view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("📒PageThreeViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("📒PageThreeViewController viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("📒PageThreeViewController viewDidDisappear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        button.center = CGPoint(x: self.view.frame.size.width  / 2,
                                y: self.view.frame.size.height / 2)
        titleLabel.center = CGPoint(x: self.view.frame.size.width - 18,
                                    y: self.view.frame.size.height - 18)
    }

    @objc func buttonTapped(sender : Any) {
        let viewController = DetailViewController()
        viewController.labelString = PageIndex.three.name
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
