//
//  Stepper.swift
//  Mum’s the word
//
//  Created by Kiri4of on 05.05.2023.
//

import UIKit

final class Stepper: UIView {
    
    var handler: ((Int) -> ())?
    
    private var count = 0
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = AppFonts.inter16Regular
        return label
    }()
    
    private(set) lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = AppFonts.inter16Regular
        label.text = "\(count)"
        return label
    }()
    
    private lazy var plusButton: BaseButton = {
        let button = BaseButton()
        button.setImage(AppImages.add, for: .normal)
        button.addTarget(
            self, action: #selector(plusButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var minusButton: BaseButton = {
        let button = BaseButton()
        button.setImage(AppImages.minus, for: .normal)
        button.addTarget(
            self, action: #selector(minusButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(title: String) {
        self.titleLabel.text = title
    }
    
    @objc private func plusButtonTapped() {
        count += 1
        countLabel.text = "\(count)"
        handler?(count)
    }
    
    @objc private func minusButtonTapped() {
        if count != 0 {
            count -= 1
        }
        countLabel.text = "\(count)"
        handler?(count)
    }
    
    private func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [
            minusButton, countLabel, plusButton
        ])
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fill
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        [plusButton,minusButton].forEach { view in
            view.snp.makeConstraints { make in
                make.size.equalTo(32)
            }
        }
        
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
    }
}
