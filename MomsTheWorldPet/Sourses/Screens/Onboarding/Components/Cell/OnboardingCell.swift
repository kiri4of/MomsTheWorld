//
//  OnboardingCell.swift
//  Mum’s the word
//
//  Created by Kiri4of on 26.04.2023.
//

import UIKit

final class OnboardingCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.primaryBlack
        label.text = "Welcome to Mum’s the word"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.font = AppFonts.sans30Bold
        return label
    }()
    
    var stackView: UIStackView!
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.descriptionGray
        label.text = "The best helper for parents and business"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = AppFonts.inter14Regular
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = AppImages.onboardingFirstScreen
        return imageView
    }()
    
    private var parallaxOffset: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgImage.layer.cornerRadius = 40.0
        bgImage.layer.maskedCorners =
        [
            .layerMinXMinYCorner, .layerMaxXMinYCorner
        ]
    }
    
    func update(_ model: OnboardingModel) {
        self.titleLabel.text = model.title
        self.descLabel.text = model.desc
        self.bgImage.image = model.image
        titleLabel.setGradientText(
            model.wordGradient,
            gradientColors: model.gradientColors
        )
    }
}

extension OnboardingCell {
    private func setupUI() {
        contentView.addSubview(bgImage)
        
        bgImage.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.lessThanOrEqualToSuperview().dividedBy(1.7)
        }
        bgImage.clipsToBounds = true
        bgImage.layer.masksToBounds = true
        
        
        stackView = UIStackView()
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descLabel)
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 16
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView.layoutMargins).inset(16)
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(96)
        }
        contentView.layoutIfNeeded()
    }
}
