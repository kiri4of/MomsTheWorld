//
//  OnboardingNavigationView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 26.04.2023.
//

import UIKit

final class NavigationOnboadingView: UIView {
    
    var handler: (() -> ())?
    
    private lazy var logoImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = AppImages.logo
        return imageView
    }()
    
    private(set) lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle(AppStrings.skip, for: .normal)
        button.backgroundColor = AppColor.lightGrayPrimary
        button.titleLabel?.font = AppFonts.inter12Regular
        button.addTarget(
            self, action: #selector(skipTap),
            for: .touchUpInside
        )
        button.sizeToFit()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func skipTap() {
        handler?()
    }
}

extension NavigationOnboadingView {
    private func setupViews() {
        addSubview(logoImg)
        addSubview(skipButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        logoImg.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.size.equalTo(CGSize(width: 91.Hadapted, height: 44.Vadapted))
        }
                
        skipButton.snp.makeConstraints { make in
            make.centerY.equalTo(logoImg.snp.centerY)
            make.right.equalToSuperview()
            make.width.equalTo(skipButton.intrinsicContentSize.width + 60.Hadapted)
            make.height.equalTo(skipButton.intrinsicContentSize.height + 16.Vadapted)
        }
        
        skipButton.layer.cornerRadius = skipButton.bounds.height / 1.5
    }
}
