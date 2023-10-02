// 
//  VerifiedView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 18.05.2023.
//

import UIKit
import Hero

protocol VerifiedViewProtocol: AnyObject {
}

final class VerifiedView: LoginView {
    
    private lazy var purpleButton = PurpleButton(bg: AppColor.Gradient.yellow)

    private lazy var header = TwoLabelStackVIew(
        title: AppStrings.confirmationCode,
        desc: AppStrings.chooseDesc
    )
    
    private var check: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = AppImages.verified
        return imageView
    }()
        
    weak var delegate: VerifiedViewProtocol?
    
    override init(_ type: LoginView.ViewType) {
        super.init(type)
        setupUI()
    }
}

extension VerifiedView {
    private func setupUI() {
        addSubview(header)
        addSubview(check)
        addSubview(purpleButton)
        setupConstraints()
        configureUI()
    }
    
    private func configureUI() {
        purpleButton.hero.id = "purpleButton"
        purpleButton.heroModifiers = [.translate(y: -100),.duration(0.5)]
        purpleButton.setTitle(AppStrings.getStarted, for: .normal)
        purpleButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        check.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(57)
            make.left.equalToSuperview().inset(26)
            make.size.equalTo(CGSize(width: 293.Hadapted, height: 264.Vadapted))
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
        print("sasja")
    }
}


