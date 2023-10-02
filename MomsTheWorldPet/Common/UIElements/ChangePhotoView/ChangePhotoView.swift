//
//  ChangePhotoView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 22.05.2023.
//

import UIKit

final class ChangePhotoView: UIView {

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.buttonBlue
        label.textAlignment = .center
        label.text = AppStrings.changePhoto
        label.numberOfLines = 0
        label.font = AppFonts.inter10SemiBold
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = AppImages.camera
        return imageView
    }()
    
    private lazy var generalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView,titleLabel])
        stack.spacing = 4
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
    private func setupUI() {
        backgroundColor = UIColor.white.withAlphaComponent(0.7)
        
        addSubview(generalStackView)
        
        generalStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(11)
            make.verticalEdges.equalToSuperview().inset(9)
        }
    }
}

