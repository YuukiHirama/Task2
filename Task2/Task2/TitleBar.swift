//
//  TitleBar.swift
//  Task2
//
//  Created by 平間雄樹 on 2019/11/13.
//  Copyright © 2019 hirama. All rights reserved.
//

import UIKit

class CustomView: UIView {

    /// タイトルラベル
    private let titleLabel:UILabel = UILabel()
    /// ログインボタン
    private let logInButton:UIButton = UIButton(type: UIButton.ButtonType.system)
    /// ログアウトボタン
    private let logOutButton:UIButton = UIButton(type: UIButton.ButtonType.system)
    /// 各種設定ボタン
    private let settingButton:UIButton = UIButton(type: UIButton.ButtonType.system)
    
    /// 共通初期化処理
    public func commonInit() {
        
        self.isUserInteractionEnabled = true
        
        /// タイトルラベル初期化
        titleLabel.text = "前回ログイン日時2019/11/0712:00:00"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = UIColor.black
        /// ログインボタンを作成
        logInButton.setTitle("ログイン",for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logInButton.addTarget(self, action: #selector(pushLogIn), for: .touchUpInside)
        /// ログアウトボタンを作成
        logOutButton.setTitle("ログアウト",for: .normal)
        logOutButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logOutButton.addTarget(self, action: #selector(pushLogOut), for: .touchUpInside)
        /// 各種設定ボタンを作成
        settingButton.setTitle("各種設定", for: .normal)
        settingButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
                
        self.addSubview(titleLabel)
        self.addSubview(logInButton)
        self.addSubview(logOutButton)
        self.addSubview(settingButton)
        
        // ボタン初期表示
        logInButton.isHidden = false
        logOutButton.isHidden = true
    }
    
    /// 格アイテムのレイアウト調整
    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.frame = CGRect(x: 10, y: 30, width: 300, height: 50)
        logInButton.frame = CGRect(x: 260, y: 30, width: 100, height: 50)
        logOutButton.frame = CGRect(x: 270, y: 30, width: 100, height: 50)
        settingButton.frame = CGRect(x: 330, y: 30, width: 100, height: 50)
    }
    
    // MARK: - EVENT
    /// ログインボタンが押された
    @objc func pushLogIn(sender: UIButton){
        logInButton.isHidden = true
        logOutButton.isHidden = false
        settingButton.frame = CGRect(x: 340, y: 30, width: 100, height: 50)
    }
    /// ログアウトボタンが押された
    @objc func pushLogOut(sender: UIButton){
        logInButton.isHidden = false
        logOutButton.isHidden = true
        settingButton.frame = CGRect(x: 330, y: 30, width: 100, height: 50)
    }
}
