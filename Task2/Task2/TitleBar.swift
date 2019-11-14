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
    lazy private var titleLabel:UILabel = self.createTitleLabel()
    /// ログインボタン
    lazy private var logInButton:UIButton = self.createlLogInButton()
    /// ログアウトボタン
    lazy private var logOutButton:UIButton = self.createLogOutButton()
    /// 各種設定ボタン
    lazy private var settingButton:UIButton = self.createSettingButton()
    /// 共通設定
    let commonView = UIStackView(frame: .zero)

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
        self.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        logOutButton.isHidden = true
        
        self.addSubview(commonView)
        self.addSubview(titleLabel)
        self.addSubview(logInButton)
        self.addSubview(logOutButton)
        self.addSubview(settingButton)
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
    private func createTitleLabel() -> UILabel {
        let label = UILabel(frame: CGRect.zero)
        label.text = "前回ログイン日時2019/11/0712:00:00"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }
    /// ログインボタンを作成
    private func createlLogInButton() -> UIButton {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("ログイン",for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(pushLogIn), for: .touchUpInside)
        return button
    }
    /// ログアウトボタンを作成
    private func createLogOutButton() -> UIButton {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("ログアウト",for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(pushLogOut), for: .touchUpInside)
        return button
    }
    /// 各種設定ボタンを作成
    private func createSettingButton() -> UIButton {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("各種設定", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
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
