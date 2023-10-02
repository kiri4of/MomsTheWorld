// 
//  BusinessHoursView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 16.05.2023.
//

import UIKit
import Hero

protocol BusinessHoursViewProtocol: AnyObject {
    func routeToLogo()
}

final class BusinessHoursView: LoginView {
    
    private lazy var hoursView = HoursView()
    
    private lazy var header = TwoLabelStackVIew(
        title: AppStrings.workHours,
        desc: AppStrings.descWorkHours
    )
    
    weak var delegate: BusinessHoursViewProtocol?
    
    private lazy var purpleButton = PurpleButton(bg: AppColor.Gradient.yellow)

    private lazy var stackView = UIStackView()
    
    override init(_ type: LoginView.ViewType) {
        super.init(type)
        setupUI()
    }
}

extension BusinessHoursView {
    private func setupUI() {
        addSubview(stackView)
        addSubview(purpleButton)
        setupConstraints()
        configureUI()
    }
    
    private func configureUI() {
        purpleButton.hero.id = "purpleButton"
        purpleButton.setTitle(AppStrings.nextButton, for: .normal)
        purpleButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 16
                
        stackView.addArrangedSubviews(
            header,hoursView
        )
        
        stackView.setCustomSpacing(16, after: header)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        hoursView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        purpleButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.width.greaterThanOrEqualTo(Spacing.buttonWidth)
            make.height.greaterThanOrEqualTo(Spacing.buttonHeight)
        }
    }
    
    @objc
    private func nextTap() {
        delegate?.routeToLogo()
    }
}


