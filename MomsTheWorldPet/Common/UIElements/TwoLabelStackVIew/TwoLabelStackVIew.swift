//
//  TwoLabelStackVIew.swift
//  Mum’s the word
//
//  Created by Kiri4of on 03.05.2023.
//

import UIKit

final class TwoLabelStackVIew: UIStackView {
    
    
    init(title: String, desc: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        descLabel.text = desc
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = AppFonts.sans24Bold
        return label
    }()
    
    private(set) lazy var descLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = AppFonts.inter14Regular
        return label
    }()
    
    private func setupUI() {
        axis = .vertical
        spacing = 10
        alignment = .leading
        distribution = .fill
        addArrangedSubviews(titleLabel,descLabel)
    }
}
