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
        titleLabel.lineBreakMode = NSLineBreakMode.byTruncatingHead
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
        
        /// 幅サイズ取得
        let width:CGFloat = self.bounds.width
        /// タイトルラベルサイズ取得
        let titleRect: CGSize = titleLabel.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        /// ログインボタンサイズ取得
        let logInRect: CGSize = logInButton.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        /// ログアウトボタンサイズ取得
        let logOutRect: CGSize = logOutButton.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        /// 設定ボタンサイズ取得
        let settingRect: CGSize = settingButton.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        
        //実際に反映する
        var x = width   // xは右端
        
        x -= 10 // 右端のスキマ分
        x -= settingRect.width
        
        settingButton.frame = CGRect(x: x,y:30,width: settingRect.width, height: settingRect.height)
        
        if logInButton.isHidden == false {
            x -= 10
            x -= logInRect.width
            logInButton.frame   = CGRect(x: x, y:30,width: logInRect.width,   height: logInRect.height)
        }
        
        if logOutButton.isHidden == false {
            x -= 10
            x -= logOutRect.width
            logOutButton.frame  = CGRect(x: x, y:30,width: logOutRect.width,  height: logOutRect.height)
        }
        
        x -= 10
        
        titleLabel.frame = CGRect(x:  10, y:35, width: x - 10,  height: titleRect.height)
        
    }
    
    // MARK: - EVENT
    /// ログインボタンが押された
    @objc func pushLogIn(sender: UIButton){
        logInButton.isHidden = true
        logOutButton.isHidden = false
        self.setNeedsLayout()
    }
    /// ログアウトボタンが押された
    @objc func pushLogOut(sender: UIButton){
        logInButton.isHidden = false
        logOutButton.isHidden = true
        self.setNeedsLayout()
    }
}
