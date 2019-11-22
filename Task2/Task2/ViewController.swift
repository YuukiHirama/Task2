//
//  ViewController.swift
//  Task2
//
//  Created by 平間雄樹 on 2019/11/13.
//  Copyright © 2019 hirama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// カスタムビュー
    private let customView = CustomView()
    
    /// ビューの初期ロード
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customView)
    }
    
    /// レイアウト設定
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        customView.frame = self.view.frame
    }
        
}
