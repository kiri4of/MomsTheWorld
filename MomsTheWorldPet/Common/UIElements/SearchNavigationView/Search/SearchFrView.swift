//
//  File.swift
//  Mum’s the word
//
//  Created by Kiri4of on 23.05.2023.
//

import Foundation

import UIKit

class SearchFrView: UIView, UITextFieldDelegate {
    
    var searchTap: (() -> ())?
    var search: ((String) -> ())?
    
    private var searchTextField: UITextField!
    private var searchImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        searchTextField = UITextField()
        searchTextField.delegate = self
        searchTextField.placeholder = "Search"
        searchTextField.borderStyle = .none
        layer.cornerRadius = 12
        layer.borderWidth = 2
        layer.borderColor = AppColor.purplePrimary.cgColor
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let searchImage = AppImages.magnifyingglass
        searchImageView = UIImageView(image: searchImage)
        searchImageView.contentMode = .scaleAspectFit
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(searchTextField)
        addSubview(searchImageView)
        
        searchTextField.snp.makeConstraints { make in
            make.leading.equalTo(searchImageView.snp.trailing).offset(16)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
                
        searchImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(16)
        }
        
        searchTextField.addTarget(self, action: #selector(getText), for: .editingChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
           searchTap?()
    }
    
    @objc
    private func getText() {
        if let text = searchTextField.text {
            search?(text)
        }
    }
}
