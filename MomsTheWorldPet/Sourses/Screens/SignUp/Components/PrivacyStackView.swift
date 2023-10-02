//
//  PrivacyStackView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 03.05.2023.
//

import UIKit

final class PrivacyStackView: UIStackView {
    
    var isAccepted: Bool = false
    
    private(set) lazy var tapAbleLabel: TapableLabel = {
        let label = TapableLabel(
            text: AppStrings.userAgreement,
            tapWord: AppStrings.chWordUserAgreement ,
            attr: .yellow) {
                print("Sasha")
            }
        label.font = AppFonts.inter14Bold
        return label
    }()
    
    private lazy var checkBoxButton: BaseButton = {
        let button = BaseButton()
        button.setImage(AppImages.checkboxEmpty, for: .normal)
        button.addTarget(
            self, action: #selector(checkBoxTap),
            for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateText(text: String) {
        self.tapAbleLabel.text = text
    }
    
    private func setupUI() {
        axis = .horizontal
        alignment = .leading
        distribution = .fill
        spacing = 12
        addArrangedSubviews(checkBoxButton,tapAbleLabel)
        
        checkBoxButton.snp.makeConstraints { make in
            make.size.equalTo(16)
        }
    }
    
    @objc
    private func checkBoxTap() {
        isAccepted.toggle()
        let image = isAccepted ? AppImages.checkboxFill : AppImages.checkboxEmpty
        checkBoxButton.setImage(image, for: .normal)
    }
}
