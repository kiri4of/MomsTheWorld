//
//  PhotoCell.swift
//  Mum’s the word
//
//  Created by Kiri4of on 22.05.2023.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    var crossDidTap: ((IndexPath) -> ())?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = AppImages.addPhoto
        return imageView
    }()
    
    private var chooseButton: ChangePhotoView! = ChangePhotoView()
    
    private lazy var crossButton: UIButton! = {
        let button = UIButton(type: .system)
        button.setImage(AppImages.cross, for: .normal)
        button.addTarget(self, action: #selector(crossTap), for: .touchUpInside)
        return button
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        chooseButton?.removeFromSuperview()
        crossButton?.removeFromSuperview()
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Photo) {
        self.imageView.image = model.image

        switch model.currentType {
        case .fill:
            imageView.snp.remakeConstraints { make in
                make.edges.equalToSuperview()
            }

            addSubview(chooseButton)
            addSubview(crossButton)

            chooseButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().inset(9)
            }

            crossButton.snp.makeConstraints { make in
                make.size.equalTo(22.Hadapted)
                make.trailing.top.equalToSuperview().inset(10)
            }

        case .empty:
            imageView.snp.remakeConstraints { make in
                make.centerX.centerY.equalToSuperview()
                make.size.equalTo(Constants.imageWidth)
            }
            imageView.image = AppImages.addPhoto

        default: break
        }
    }

    
    private func setupUI() {
        backgroundColor = AppColor.bgCell
        clipsToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.size.equalTo(Constants.imageWidth)
        }
    }
    
    @objc private func crossTap() {
        if let indexPath {
            crossDidTap?(indexPath)
        }
    }
}

extension PhotoCell {
    private enum Constants {
        static let cornerRadius: CGFloat = 16
        static let imageWidth = 60
    }
}

