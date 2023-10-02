//
//  WelcomeViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private lazy var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = AppImages.welcome
        return imageView
    }()
    
    private var stackView: UIStackView = UIStackView()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.purplePrimary
        label.text = AppStrings.welcomeTitle
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.font = AppFonts.sans30Bold
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.whitePrimary
        label.text = AppStrings.welcomeDesc
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = AppFonts.inter16Regular
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension WelcomeViewController {
    
    private func setupViews() {
        self.hero.isEnabled = true
        view.addSubview(bgImage)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descLabel)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 26.Vadapted
        view.addSubview(stackView)
        setConstraints()
    }
    
    private func setConstraints() {
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.centerX.equalToSuperview()
        }
    }
}
