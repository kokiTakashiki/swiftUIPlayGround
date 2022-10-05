//
//  PageOneViewController.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/08/10.
//

import UIKit

class PageOneViewController: UIViewController {
    
    // 画面のタイトル用ラベル
    private let titleLabel = UILabel()
    // ボタンのインスタンス生成
    private let button = UIButton()
    var collectionView: UICollectionView!
    
    var viewModel: SegmentPickerPageViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
        // スクリーンの横縦幅
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height
        
        titleLabel.frame = CGRect(x:0, y:0,
                                  width:screenWidth/2, height:50)
        titleLabel.text = PageIndex.one.name
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
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(
            width: self.view.frame.width / 5,
            height: self.view.frame.width / 5
        )
        flowLayout.minimumInteritemSpacing = self.view.bounds.height
        flowLayout.minimumLineSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/4) ,
            collectionViewLayout:flowLayout
        )
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        viewModel?.state.swipeable = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
        //viewModel?.state.swipeable = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesCancelled")
        //viewModel?.state.swipeable = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if viewModel.state.selectionIndex == .one {
            print("📙PageOneViewController viewWillAppear")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if viewModel.state.selectionIndex == .one {
            print("📙PageOneViewController viewDidAppear")
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("📙PageOneViewController viewDidDisappear")
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
        viewController.labelString = PageIndex.one.name
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}

extension PageOneViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 100
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            if(indexPath.row % 2 == 0){
                cell.backgroundColor = .red
            }else{
                cell.backgroundColor = .blue
            }

            return cell
        }
}
