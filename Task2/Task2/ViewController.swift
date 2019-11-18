//
//  ViewController.swift
//  Task2
//
//  Created by 平間雄樹 on 2019/11/13.
//  Copyright © 2019 hirama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties -
    /// カスタムビュー
    private let customView:CustomView = CustomView()

    // MARK: - Life cycle events -
    // ビューの初期ロード
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(customView)
    }
    
    // レイアウト設定
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.layoutCustomView()
    }

    // MARK: - Layout subviews -
    /// カスタムビューのサイズと位置指定
    private func layoutCustomView() {
        // iOS11よりも上だったら
        if #available(iOS 11.0, *) {
            customView.frame.origin = self.view.safeAreaLayoutGuide.layoutFrame.origin
            customView.frame.size = CGSize(width: self.view.safeAreaLayoutGuide.layoutFrame.width, height: 44)
        }else{
        // iOS11よりも下だったら
            customView.frame.origin = self.view.frame.origin
            customView.frame.size = CGSize(width: self.view.frame.width, height: 44)
        }
    }
}
