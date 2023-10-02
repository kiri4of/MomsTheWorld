// 
//  StartScreenView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 27.04.2023.
//

import UIKit
import Hero

protocol StartScreenViewProtocol: AnyObject {
    func routeLogin()
    func routeNextStep()
}

final class StartScreenView: UIView {
    
    weak var delegate: StartScreenViewProtocol?
    
    private var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = AppImages.start
        return imageView
    }()
    
    private lazy var purpleButton = PurpleButton()
    private lazy var loginButton = PurpleButton(bg: UIColor.white.withAlphaComponent(0.5))
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = AppStrings.startScreen
        label.textColor = AppColor.primaryBlack
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.font = AppFonts.sans30Bold
        return label
    }()
    
    private lazy var navigationView = NavigationOnboadingView()
    
    private let stackViewLabels = UIStackView()
    private let stackViewButtons = UIStackView()
        
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = AppStrings.onboardingFirstScreenDesc
        label.textColor = AppColor.descriptionGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = AppFonts.inter14Regular
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateUI()
    }
    
    @objc
    private func nextTap() {
        delegate?.routeNextStep()
    }
    
    @objc
    private func loginTap() {
        delegate?.routeLogin()
    }
}

extension StartScreenView {
    private func setUI() {
        addSubview(bgImage)
        addSubview(navigationView)
        
        bgImage.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.lessThanOrEqualToSuperview().dividedBy(1.7)
        }
        bgImage.clipsToBounds = true
        bgImage.layer.masksToBounds = true
        
        [stackViewLabels,stackViewButtons].forEach { stackView in
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 16
            
            switch stackView {
            case stackViewLabels:
                stackView.alignment = .leading
                stackView.addArrangedSubviews(titleLabel,descLabel)
                addSubview(stackView)
                stackView.snp.makeConstraints { make in
                    make.leading.trailing.equalTo(layoutMargins).inset(16)
                    make.top.equalTo(safeAreaLayoutGuide).offset(96)
                }
            case stackViewButtons:
                stackView.alignment = .center
                stackView.addArrangedSubviews(purpleButton,loginButton)
                addSubview(stackView)
                stackView.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.bottom.lessThanOrEqualTo(safeAreaLayoutGuide).inset(Spacing.height)
                }
            default: break
            }
        }
       
        [purpleButton,loginButton].forEach { view in
            view.snp.makeConstraints { make in
                make.size.equalTo(CGSize(
                    width: Spacing.buttonWidth,
                    height: Spacing.buttonHeight)
                )
            }
        }
        
        navigationView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(layoutMargins).inset(Spacing.defaultSpacing)
            make.height.greaterThanOrEqualTo(Spacing.height)
            make.top.equalTo(safeAreaLayoutGuide).offset(layoutMargins.top)
        }
        configureUI()
    }
    
    private func configureUI() {
        backgroundColor = .white
        loginButton.addBorder()
        purpleButton.setTitle(AppStrings.nextButton, for: .normal)
        loginButton.setTitle(AppStrings.loginButton, for: .normal)
        navigationView.skipButton.isHidden = true
        purpleButton.addTarget(
            self, action: #selector(nextTap), for: .touchUpInside)
        
        loginButton.addTarget(
            self, action: #selector(loginTap), for: .touchUpInside)
    }
    
    private func updateUI() {
        bgImage.layer.cornerRadius = 40.0
        bgImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        purpleButton.hero.id = "purpleButton"
        purpleButton.heroModifiers = [.translate(y: -100)]
        loginButton.heroModifiers = [.fade, .scale(0.4), .duration(0.4)]
        layoutIfNeeded()
        titleLabel.setGradientText(
            AppStrings.startGradientWord,
            gradientColors: AppColor.Gradient.yellowRed
        )
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { view in
            self.addArrangedSubview(view)
        }
    }
}
