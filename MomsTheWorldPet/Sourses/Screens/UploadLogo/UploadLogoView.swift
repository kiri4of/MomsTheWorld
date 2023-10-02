// 
//  UploadLogoView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 13.05.2023.
//

import UIKit
import Hero

protocol UploadLogoViewProtocol: AnyObject {
    func openCompanyPhotos()
}

final class UploadLogoView: LoginView {
            
    private(set) lazy var purpleButton = PurpleButton(bg: AppColor.Gradient.yellow)
    private(set) lazy var chooseLogoView = ChooseLogoView(frame: .zero)
    
    private(set) lazy var card = CompanyCardView()
    
    private lazy var header = TwoLabelStackVIew(
        title: AppStrings.uploadLogo,
        desc: AppStrings.descUploadLogo
    )
    
    private lazy var stackView = UIStackView()
    
    weak var delegate: UploadLogoViewProtocol?
    
    override init(_ type: LoginView.ViewType) {
        super.init(type)
        setupUI()
    }
}

extension UploadLogoView {
    private func setupUI() {
        addSubview(stackView)
        addSubview(purpleButton)
            
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 16
        let width = 200.Hadapted
        
        let containterView = ContainterView(view: chooseLogoView) { view in
            view.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: width, height: width))
            }
        }
                
        stackView.addArrangedSubviews(
            header,containterView,card
        )
        
        stackView.setCustomSpacing(30, after: header)
        stackView.setCustomSpacing(40, after: containterView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        containterView.snp.makeConstraints { make in
            make.width.equalTo(stackView)
            make.height.equalTo(width)
        }
        
        card.snp.makeConstraints { make in
            make.width.equalTo(stackView)
        }
        
        purpleButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.width.greaterThanOrEqualTo(Spacing.buttonWidth)
            make.height.greaterThanOrEqualTo(Spacing.buttonHeight)
        }
        purpleButton.hero.id = "purpleButton"
        purpleButton.setTitle(AppStrings.nextButton, for: .normal)
        purpleButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
    }
    
    @objc
    private func nextTap() {
        delegate?.openCompanyPhotos()
    }
}


