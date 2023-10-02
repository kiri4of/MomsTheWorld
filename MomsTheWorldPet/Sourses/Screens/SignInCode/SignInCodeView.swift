// 
//  SignInCodeView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 11.05.2023.
//

import UIKit
import Hero

protocol SignInCodeViewProtocol: AnyObject {
}

final class SignInCodeView: LoginView {

    private lazy var resendButton: BaseButton = {
        let button = BaseButton()
        button.setTitle(AppStrings.resend, for: .normal)
        button.titleLabel?.font = AppFonts.inter16Bold
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var purpleButton = PurpleButton(bg: AppColor.purplePrimary)
    private(set) lazy var otpTextField = OTPStackView(
        frame: bounds)
        
    private lazy var header = TwoLabelStackVIew(
        title: AppStrings.confirmationCode,
        desc: AppStrings.chooseDesc
    )
    
    private lazy var stackView = UIStackView()
    
    weak var delegate: SelectLocationViewProtocol?
    
    override init(_ type: LoginView.ViewType) {
        super.init(type)
        setupUI()
    }
    
    func update(text: String) {
        header.descLabel.text = AppStrings.addEmailOrPhone(text)
    }
}

extension SignInCodeView {
    private func setupUI() {
        addSubview(header)
        addSubview(otpTextField)
        addSubview(resendButton)
        addSubview(purpleButton)
        setupConstraints()
        configureUI()
    }
    
    private func configureUI() {
        purpleButton.hero.id = "purpleButton"
        purpleButton.heroModifiers = [.translate(y: -100),.duration(0.5)]
        purpleButton.setTitle(AppStrings.nextButton, for: .normal)
        purpleButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        otpTextField.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(Spacing.textFieldheight)
        }
        
        resendButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(otpTextField.snp.bottom).offset(40)
            make.width.greaterThanOrEqualTo(Spacing.buttonWidth)
            make.height.greaterThanOrEqualTo(Spacing.buttonHeight)
        }
        
        purpleButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(resendButton.snp.bottom).offset(19)
            make.width.greaterThanOrEqualTo(Spacing.buttonWidth)
            make.height.greaterThanOrEqualTo(Spacing.buttonHeight)
        }
    }
    
    @objc
    private func nextTap() {
        print("sasja")
    }
}

