// 
//  RoleView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 29.04.2023.
//

import UIKit
import Hero

protocol RoleViewProtocol: AnyObject {
    func routeToSignUP()
    func routeToLogin()
    func getRole(_ role: Roles)
}

final class RoleView: LoginView {
    
    private lazy var parentRoleButton =  RoleButton()
    private lazy var businessRoleButton = RoleButton()
    private lazy var purpleButton = PurpleButton(bg: AppColor.Gradient.yellow)
    
    private lazy var tapAbleLabel: TapableLabel = {
        let label = TapableLabel(
            text: AppStrings.underLineLogin,
            tapWord: AppStrings.chWordLogin ,
            attr: .white) { [weak self] in
                self?.delegate?.routeToLogin()
            }
        label.textColor = .white
        label.font = AppFonts.inter14Bold
        return label
    }()
        
    private lazy var header = TwoLabelStackVIew(
        title: AppStrings.choose,
        desc: AppStrings.chooseDesc
    )
    
    private lazy var stackView = UIStackView()
    
    weak var delegate: RoleViewProtocol?
    
    override init(_ type: LoginView.ViewType) {
        super.init(type)
        setupUI()
    }
}

extension RoleView {
    private func setupUI() {
        addSubview(stackView)
        addSubview(purpleButton)
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 16
                
        stackView.addArrangedSubviews(
            header,parentRoleButton,businessRoleButton,tapAbleLabel
        )
        stackView.setCustomSpacing(30, after: header)
        stackView.setCustomSpacing(24, after: businessRoleButton)
        
        businessRoleButton.updateUI(Roles.business.getModel())
        
        parentRoleButton.updateUI(Roles.parent.getModel())
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
        
        purpleButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stackView.snp.bottom).offset(40)
            make.width.greaterThanOrEqualTo(Spacing.buttonWidth)
            make.height.greaterThanOrEqualTo(Spacing.buttonHeight)
        }
        purpleButton.hero.id = "purpleButton"
        purpleButton.heroModifiers = [.translate(y: -100),.duration(0.5)]
        purpleButton.setTitle(AppStrings.nextButton, for: .normal)
        purpleButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
        configureUI()
    }
    
    private func configureUI() {
        let buttons: [RoleButton] = [parentRoleButton, businessRoleButton]
        buttons.forEach { v in
            v.handler = { [weak self] model in
                guard let self = self else { return }
                buttons.forEach { $0.changeUI(isClear: true) }
                v.changeUI(isClear: false)
                self.delegate?.getRole(model)
            }
        }
    }
    
    @objc
    private func nextTap() {
        delegate?.routeToSignUP()
    }
}

