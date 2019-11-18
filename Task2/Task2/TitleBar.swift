//
//  TitleBar.swift
//  Task2
//
//  Created by 平間雄樹 on 2019/11/13.
//  Copyright © 2019 hirama. All rights reserved.
//

import UIKit

class CustomView: UIView {

    // MARK: - Properties -
    /// タイトルラベル
    private let titleLabel:UILabel = UILabel()
    /// ログインボタン
    private let logInButton:UIButton = UIButton(type: UIButton.ButtonType.system)
    /// ログアウトボタン
    private let logOutButton:UIButton = UIButton(type: UIButton.ButtonType.system)
    /// 各種設定ボタン
    private let settingButton:UIButton = UIButton(type: UIButton.ButtonType.system)
    /// 共通設定
    private let commonView = UIStackView(frame: .zero)

    // MARK: - Life cycle events -
    /// 指定イニシャライザ
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()

    }
    /// 必須イニシャライザ
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
        self.commonInit()
    }

    /// 共通初期化処理
    private func commonInit() {
        
        createTitleLabel()
        createlLogInButton()
        createLogOutButton()
        createSettingButton()
        
        self.addSubview(commonView)
        self.addSubview(titleLabel)
        self.addSubview(logInButton)
        self.addSubview(logOutButton)
        self.addSubview(settingButton)
        
        self.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        logInButton.isHidden = false
        logOutButton.isHidden = true
    }
    
    /// 格アイテムのレイアウト調整
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutStackView()
        self.layoutTitleLabel()
        self.layoutLoginButton()
        self.layoutLogOutButton()
        self.layoutSettingButton()
    }

    // MARK: - Create subviews -
    /// タイトルラベルを作成
    private func createTitleLabel(){
        titleLabel.text = "前回ログイン日時2019/11/0712:00:00"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = UIColor.black
    }
    /// ログインボタンを作成
    private func createlLogInButton(){
        logInButton.setTitle("ログイン",for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logInButton.addTarget(self, action: #selector(pushLogIn), for: .touchUpInside)
    }
    /// ログアウトボタンを作成
    private func createLogOutButton(){
        logOutButton.setTitle("ログアウト",for: .normal)
        logOutButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logOutButton.addTarget(self, action: #selector(pushLogOut), for: .touchUpInside)
    }
    /// 各種設定ボタンを作成
    private func createSettingButton(){
        settingButton.setTitle("各種設定", for: .normal)
        settingButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }

    // MARK: - Layout subviews -
    /// 共通設定
    private func layoutStackView() {
        commonView.axis = .horizontal
        commonView.alignment = .center
        commonView.spacing = 10
        commonView.translatesAutoresizingMaskIntoConstraints = false
        commonView.center.x += 10
        commonView.frame.origin.y += 5
    }
    /// タイトルのレイアウト調整
    private func layoutTitleLabel() {
        commonView.addArrangedSubview(titleLabel)
    }
    /// ログインボタンのレイアウト調整
    private func layoutLoginButton() {
        commonView.addArrangedSubview(logInButton)
    }
    /// ログアウトのレイアウト調整
    private func layoutLogOutButton() {
        commonView.addArrangedSubview(logOutButton)
    }
    /// 各種設定のレイアウト調整
    private func layoutSettingButton() {
        commonView.addArrangedSubview(settingButton)
    }
    
    // MARK: - button events -
    /// ログインボタンが押された
    @objc func pushLogIn(sender: UIButton){
        logInButton.isHidden = true
        logOutButton.isHidden = false
    }
    /// ログアウトボタンが押された
    @objc func pushLogOut(sender: UIButton){
        logInButton.isHidden = false
        logOutButton.isHidden = true
    }

}
