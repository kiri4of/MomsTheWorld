//
//  DarkLoginView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    enum ViewType {
        case light
        case dark
    }
    
    private(set) lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = AppImages.logoYellow
        return imageView
    }()
    
    private(set) lazy var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    init(_ type: ViewType) {
        super.init(frame: .zero)
        setup(type)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ type: ViewType) {
        switch type {
        case .light:
            bgImage.image = AppImages.lightBg
        case .dark:
            bgImage.image = AppImages.role
        }
        
        addSubview(bgImage)
        addSubview(logoImage)
        
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(layoutMargins.top)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 110.Hadapted, height: 52.Vadapted))
        }
        
    }
}
