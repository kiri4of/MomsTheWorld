//
//  CompanyCardView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 13.05.2023.
//

import UIKit

final class CompanyCardView: UIView {
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = AppImages.companyCardLogo
        clipsToBounds = true
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = AppStrings.choose
        label.font = AppFonts.inter18Bold
        return label
    }()
    
    private lazy var locationTitleView = LocationTitleView()
    
    private lazy var generalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [logoImage, verticalStackView])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 16
        return stack
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel,locationTitleView])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 6
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        logoImage.layer.cornerRadius = 53.Hadapted / 2
        logoImage.clipsToBounds = true
    }
    
    func update(image: UIImage) {
        self.logoImage.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CompanyCardView {
    private func setupViews() {
        addSubview(generalStackView)
        let width = 53.Hadapted
        logoImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: width, height: width))
        }
        
        generalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        self.backgroundColor = .white
        self.layer.cornerRadius = 25
    }
}


final class LocationTitleView: UIStackView {
    
    private(set) lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = AppImages.locationMark
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.descGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = AppStrings.choose
        label.font = AppFonts.inter14Regular
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addArrangedSubviews(logoImage, titleLabel)
        axis = .horizontal
        distribution = .fill
        alignment = .leading
        spacing = 8
        
        logoImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(
                width: 10.Hadapted, height: 13.Vadapted))
        }
    }
}
