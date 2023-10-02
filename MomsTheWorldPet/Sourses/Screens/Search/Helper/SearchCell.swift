//
//  SearchCell.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.05.2023.
//

import UIKit

final class SearchCell: UICollectionViewCell {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.inter14Regular
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func configure(model: CityElement) {
        titleLabel.text = model.name
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }

    private func setup() {
        contentView.addSubview(titleLabel)
        layer.cornerRadius = 12
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
