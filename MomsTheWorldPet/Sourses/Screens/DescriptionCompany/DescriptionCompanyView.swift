// 
//  DescriptionCompanyView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit
import SnapKit

protocol DescriptionCompanyViewProtocol: AnyObject {
    func routeToBusinessHours()
}

final class DescriptionCompanyView: LoginView {
    
    var textViewHeightConstraint: Constraint?
    
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.autoresizingMask = [.flexibleHeight]
        return scrollView
    }()
    
    private lazy var purpleButton = PurpleButton(bg: AppColor.primaryOrange)
    
    private(set) lazy var textView: UITextView = {
       let textView = UITextView()
        textView.layer.cornerRadius = 12
        textView.font = AppFonts.inter14Regular
        textView.addPlaceholder(AppStrings.textViewPlaceHolder)
        textView.setPadding(top: 16, left: 8, bottom: 16, right: 8)
        textView.backgroundColor = AppColor.primaryGrayTextFiled
        return textView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = AppFonts.sans24Bold
        label.text = AppStrings.companyDescription
        return label
    }()
    
    weak var delegate: DescriptionCompanyViewProtocol?
    
    override init(_ type: LoginView.ViewType) {
        super.init(type)
        setupUI()
    }
}

extension DescriptionCompanyView {
    private func setupUI() {
        addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(textView)
        scrollView.addSubview(purpleButton)
        setupConstaints()
        configureUI()
    }
    
    private func configureUI() {
        purpleButton.hero.id = "purpleButton"
        purpleButton.heroModifiers = [.translate(y: -100),.duration(0.5)]
        purpleButton.setTitle(AppStrings.nextButton, for: .normal)
        purpleButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
    }
    
    private func setupConstaints() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(36)
            make.leading.equalTo(self).inset(16)
            make.trailing.equalTo(self).inset(16)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(120)
            make.leading.trailing.equalTo(self).inset(16)
            textViewHeightConstraint = make.height.equalTo(120).constraint
        }
        
        purpleButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textView.snp.bottom).offset(40)
            make.width.greaterThanOrEqualTo(Spacing.buttonWidth)
            make.height.greaterThanOrEqualTo(Spacing.buttonHeight)
        }
    }
    
    @objc
    private func nextTap() {
        delegate?.routeToBusinessHours()
    }
}
