//
//  ChooseLogoView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 13.05.2023.
//

import UIKit

//helper to stackView

final class ContainterView<View: UIView>: UIView {
    
    init(view: View, configure: @escaping (View) -> ()) {
        super.init(frame: .zero)
        backgroundColor = .clear
        addSubview(view)
        configure(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class ChooseLogoView: UIImageView {
    
    var handler: (() -> ())?
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = AppStrings.upload
        label.font = AppFonts.inter14Bold
        label.backgroundColor = AppColor.fieldColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        handler?() 
    }
    
    func updateView(uiimage: UIImage) {
        self.titleLabel.text = AppStrings.edit
        self.image = uiimage
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(42.Vadapted)
        }
        
        isUserInteractionEnabled = true
        
        clipsToBounds = true
        
        contentMode = .scaleAspectFill
        
        image = AppImages.logoPlaceholder
    }
}
