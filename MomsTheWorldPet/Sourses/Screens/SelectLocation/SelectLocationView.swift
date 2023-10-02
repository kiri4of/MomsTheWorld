// 
//  SelectLocationView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 05.05.2023.
//

import UIKit
import Hero

protocol SelectLocationViewProtocol: AnyObject {
    func routeToNextScreen(role: Roles)
    func routeToLacationScreen()
}

final class SelectLocationView: LoginView {
    
    private var role: Roles?
    
    private lazy var purpleButton = PurpleButton(bg: AppColor.Gradient.yellow)
    private lazy var locationPicker = DefaultTextField(
        placeHolder: "Your Location", type: .picker)
    
    private lazy var stepper = Stepper()
    
    private lazy var header = TwoLabelStackVIew(
        title: AppStrings.companyLocation,
        desc: AppStrings.gradinetFirst
    )
    
    private lazy var stackView = UIStackView()
    
    weak var delegate: SelectLocationViewProtocol?
    
    init(role: Roles, _ type: LoginView.ViewType) {
        super.init(type)
        self.role = role
        setupUI()
    }
    
    func update(name: String) {
        if role == .parent {
            let string = AppStrings.addName(name)
            header.titleLabel.attributedText = string
        } else {
            let company = AppStrings.companyLocation
            header.titleLabel.text = company
        }
    }
}

extension SelectLocationView {
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
        stepper.updateUI(title: AppStrings.stepperTitle)
        stepper.handler = { count in
            print(count)
        }
        
        locationPicker.locationHandler = { [weak self] in
            self?.delegate?.routeToLacationScreen()
        }
    }
    
    private func setupConstraints() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 16
                
        stackView.addArrangedSubviews(
            header,locationPicker
        )
        
        if role == .parent {
            stackView.addArrangedSubview(stepper)
        }
        
        stackView.setCustomSpacing(30, after: header)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        locationPicker.snp.makeConstraints { make in
            make.width.equalTo(stackView)
            make.height.equalTo(Spacing.textFieldheight)
        }
        
        if role == .parent {
            stepper.snp.makeConstraints { make in
                make.width.equalTo(stackView)
            }
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
        if let role {
            delegate?.routeToNextScreen(role: role)
        }
    }
}

