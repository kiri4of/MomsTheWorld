// 
//  CompanyPhoneView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit
import Hero

protocol CompanyPhoneViewProtocol: AnyObject {
    func nextTap()
}

final class CompanyPhoneView: LoginView {
    
    private lazy var purpleButton = PurpleButton(bg: AppColor.primaryOrange)
    
    private(set) lazy var phoneTextField = DefaultTextField(
        placeHolder: "Phone", type: .textField)
        
    private lazy var header = TwoLabelStackVIew(
        title: AppStrings.enterPhone,
        desc: AppStrings.descSignIn
    )
    
    private lazy var stackView = UIStackView()
    
    weak var delegate: CompanyPhoneViewProtocol?
    
    override init(_ type: LoginView.ViewType) {
        super.init(type)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(name: String) {
        header.titleLabel.attributedText = AppStrings.addName(name)
    }
}

extension CompanyPhoneView {
    private func setupUI() {
        addSubview(stackView)
        addSubview(purpleButton)
        setupConstraints()
        configureUI()
    }
    
    private func configureUI() {
        purpleButton.hero.id = "purpleButton"
        purpleButton.heroModifiers = [.translate(y: -100),.duration(0.5)]
        purpleButton.setTitle(AppStrings.nextButton, for: .normal)
        purpleButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
        phoneTextField.keyboardType = .numberPad
    }
    
    private func setupConstraints() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 16
                
        stackView.addArrangedSubviews(
            header,phoneTextField
        )
        
        stackView.setCustomSpacing(30, after: header)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        phoneTextField.snp.makeConstraints { make in
            make.width.equalTo(stackView)
            make.height.equalTo(Spacing.textFieldheight)
        }
        
        purpleButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stackView.snp.bottom).offset(40)
            make.width.greaterThanOrEqualTo(Spacing.buttonWidth)
            make.height.greaterThanOrEqualTo(Spacing.buttonHeight)
        }
    }
    
    @objc
    private func nextTap() {
        delegate?.nextTap()
    }
}


