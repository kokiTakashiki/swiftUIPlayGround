//
//  DetailViewController.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/14.
//

import UIKit

class DetailViewController: UIViewController {
    
    var labelString: String = ""
    
    // 画面のタイトル用ラベル
    private let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        title = "test DetailView"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightGray
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        
        // スクリーンの横縦幅
        let screenWidth:CGFloat = self.view.frame.width
        //let screenHeight:CGFloat = self.view.frame.height
        
        titleLabel.frame = CGRect(x:0, y:0,
                                  width:screenWidth/2, height:50)
        titleLabel.text = labelString
        self.view.addSubview(titleLabel)
        
        // UITextFieldを生成
        let textField = UITextField()
        textField.frame = CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width-20, height: 38)
        // プレースホルダを設定
        textField.placeholder = "入力してください。"
        // キーボードタイプを指定
        textField.keyboardType = .default
        // 枠線のスタイルを設定
        textField.borderStyle = .roundedRect
        // 改行ボタンの種類を設定
        textField.returnKeyType = .done
        // テキストを全消去するボタンを表示
        textField.clearButtonMode = .always
        // UITextFieldを追加
        self.view.addSubview(textField)
        // デリゲートを指定
        textField.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        titleLabel.center = CGPoint(x: self.view.frame.size.width - 18,
                                    y: self.view.frame.size.height - 18)
    }
}

extension DetailViewController: UITextFieldDelegate {
    
}
