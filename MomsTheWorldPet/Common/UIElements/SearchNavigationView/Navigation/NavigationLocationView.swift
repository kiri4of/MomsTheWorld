//
//  SearchNavigationVIew.swift
//  Mum’s the word
//
//  Created by Kiri4of on 23.05.2023.
//

import UIKit
import SnapKit

final class BackNavigationView: UIView {
    
    var backTap: (() -> ())?
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImages.backArrow, for: .normal)
        button.addTarget(self, action: #selector(backTaped), for: .touchUpInside)
        return button
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = AppFonts.inter12SemiBold
        button.setTitleColor(AppColor.purplePrimary, for: .normal)
        button.addTarget(self, action: #selector(backTaped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = AppFonts.inter14Bold
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTitle(text: String = "Your Location") {
        title.text = text
    }
}

extension BackNavigationView {
    private func setupUI() {
        let buttonHeight = 20
        addSubview(backButton)
        addSubview(title)
        addSubview(saveButton)
        
        title.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
       
        backButton.snp.makeConstraints { make in
            make.width.equalTo(buttonHeight)
            make.height.equalTo(buttonHeight)
            make.leading.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        saveButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc
    private func backTaped() {
        backTap?()
    }
}


