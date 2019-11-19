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
    
    private var loginFrag = false
    
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
        

        settingButton.frame = CGRect(x: width-70, y: 30, width: settingRect.width, height: settingRect.height)
        
        logInButton.frame = CGRect(x: settingButton.frame.maxX - 130,y:30,width:logInRect.width, height: logInRect.height)
        
        logOutButton.frame = CGRect(x: settingButton.frame.maxX - 145,y:30,width:logOutRect.width, height: logOutRect.height)
        
       ///ログイン状況によって表示方法を変える
       if(loginFrag){
        logInButton.isHidden = true
        logOutButton.isHidden = false

            if(width > 500){
                titleLabel.frame = CGRect(x: logOutButton.frame.maxX - 350, y: 35, width: titleRect.width , height: titleRect.height)
            }else{
                titleLabel.frame = CGRect(x: logOutButton.frame.maxX - 300, y: 35, width: titleRect.width - 35  , height: titleRect.height)
                titleLabel.lineBreakMode = NSLineBreakMode.byTruncatingHead
            }

       }else{
        logInButton.isHidden = false
        logOutButton.isHidden = true
        titleLabel.frame = CGRect(x: logInButton.frame.maxX - 330, y: 35, width: titleRect.width , height: titleRect.height)
       }
    }
    
    // MARK: - EVENT
    /// ログインボタンが押された
    @objc func pushLogIn(sender: UIButton){
        loginFrag = true
        self.setNeedsLayout()
    }
    /// ログアウトボタンが押された
    @objc func pushLogOut(sender: UIButton){
        loginFrag = false
        self.setNeedsLayout()
    }
}
