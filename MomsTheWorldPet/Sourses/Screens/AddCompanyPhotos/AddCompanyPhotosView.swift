// 
//  AddCompanyPhotosView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

protocol AddCompanyPhotosViewProtocol: AnyObject {
    func nextTap()
}

final class AddCompanyPhotosView: LoginView {
    
    weak var delegate: AddCompanyPhotosViewProtocol?
    
    private lazy var header = TwoLabelStackVIew(
        title: AppStrings.addCompanyPhoto,
        desc: AppStrings.firstDescAddCompanyPhoto
    )
    
    private(set) lazy var collection: UICollectionView = {
        let layout = AddCompanyLayoutBuilder.createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        PhotoCell.registerWithoutNib(for: collection)
        collection.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 55, right: 0)
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        return collection
    }()
    
    private lazy var purpleButton = PurpleButton(bg: AppColor.Gradient.yellow)
    
    override init(_ type: LoginView.ViewType) {
        super.init(type)
        setupUI()
    }
    
    func changeHeader(willChanged: Bool) {
        header.descLabel.text = willChanged
        ? AppStrings.secondDescAddCompanyPhoto
        : AppStrings.firstDescAddCompanyPhoto
    }
}

extension AddCompanyPhotosView {
    private func setupUI() {
        addSubview(header)
        addSubview(collection)
        addSubview(purpleButton)
        setupConstraints()
        configureUI()
    }
    
    private func configureUI() {
        purpleButton.hero.id = "purpleButton"
        purpleButton.setTitle(AppStrings.nextButton, for: .normal)
        purpleButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        collection.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(250.Vadapted)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        purpleButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.width.greaterThanOrEqualTo(Spacing.buttonWidth)
            make.height.greaterThanOrEqualTo(Spacing.buttonHeight)
        }
    }
    
    @objc
    private func nextTap() {
        delegate?.nextTap()
    }
}
