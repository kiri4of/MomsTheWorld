//
//  TextField.swift
//  Mum’s the word
//
//  Created by Kiri4of on 30.04.2023.
//

import UIKit

final class DefaultTextField: UITextField {
    
    var locationHandler: (() -> ())?
    
    enum ElementType {
        case picker
        case textField
    }
    
    private var type: ElementType = .textField
    
    init(placeHolder: String, type: ElementType? = nil) {
        super.init(frame: .zero)
        if let type {
            self.type = type
        }
        placeholder = placeHolder
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 12
    }
    
    private func configure() {
        backgroundColor = AppColor.primaryGrayTextFiled
        layer.borderWidth = 3
        layer.borderColor = AppColor.primaryGrayTextFiled.cgColor
        setLeftPaddingPoints(16)
        setRightPaddingPoints(16)
        switch type {
        case .picker:
            addPickerView()
            let tapGesture = UITapGestureRecognizer(
                target: self, action: #selector(pickerTapped))
            addGestureRecognizer(tapGesture)
        case .textField:
            addTarget(self, action: #selector(textFieldDidChange(_ :)), for: .editingChanged)
        }
    }
    
    private func addPickerView() {
        let imageView = UIImageView()
        imageView.image = AppImages.picker
        imageView.contentMode = .scaleToFill
        let width = 12.Hadapted
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(width)
            make.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
}

extension DefaultTextField {
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        let colorOfBorder = text.isEmpty ?
        AppColor.primaryGrayTextFiled.cgColor : AppColor.purplePrimary.cgColor
        let bgColor = text.isEmpty ? AppColor.primaryGrayTextFiled : .white
        
        layer.borderColor = colorOfBorder
        backgroundColor = bgColor
    }
    
    @objc
    private func pickerTapped() {
        locationHandler?()
    }
}
