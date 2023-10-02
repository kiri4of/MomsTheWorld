//
//  RoleButton.swift
//  Mum’s the word
//
//  Created by Kiri4of on 29.04.2023.
//

import UIKit

class BaseButton: UIButton {
    
    override var isHighlighted: Bool {
        get { return super.isHighlighted }
        set {
            guard newValue != isHighlighted else { return }
            
            if newValue == true {
                titleLabel?.alpha = 0.25
            } else {
                UIView.animate(withDuration: 0.25) {
                    self.titleLabel?.alpha = 1
                }
                super.isHighlighted = newValue
            }
            super.isHighlighted = newValue
        }
    }
}

final class RoleButton: BaseButton {
    
    var handler: ((_ model: Roles) -> ())?
    private var model: RoleButtonModel?
    
    private var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var exImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        imageView.image = AppImages.ex
        return imageView
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = AppFonts.sans24Bold
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = AppFonts.inter14Bold
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let stackViewH = UIStackView()
    private let stackViewV = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    override func touchesBegan(
        _ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
            if let model = model {
                handler?(model.type)
            }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white.withAlphaComponent(0.5)
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.shadowColor = AppColor.purplePrimary.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10.0
        bgImage.layer.borderWidth = 3
        bgImage.layer.borderColor = UIColor.white.cgColor
        setupUI()
    }
    
    func updateUI(_ model: RoleButtonModel) {
        self.model = model
        bgImage.image = model.image
        headerLabel.text = model.title
        descLabel.text = model.desc
    }
    
    func changeUI(isClear: Bool) {
        let alpha: CGFloat = isClear ? 0 : 1
        UIView.animate(withDuration: 0.2) {
            self.exImage.alpha = alpha
        }
    }
}

extension RoleButton {
    private func setupUI() {
        configureStackViews()
        addSubview(stackViewH)
        bgImage.addSubview(exImage)
        let imageWidth = 89.Hadapted
        self.layer.cornerRadius = 22
        self.bgImage.layer.cornerRadius = imageWidth/2
        
        
        stackViewH.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        stackViewV.snp.makeConstraints { make in
            make.width.equalTo(159.Hadapted)
        }
        
        [bgImage,exImage].forEach { view in
            view.snp.makeConstraints { make in
                make.size.equalTo(imageWidth)
            }
        }
    }
    
    private func configureStackViews() {
        stackViewV.addArrangedSubviews(headerLabel,descLabel)
        stackViewV.axis = .vertical
        stackViewV.distribution = .fill
        stackViewV.alignment = .leading
        stackViewV.spacing = 8
        stackViewH.addArrangedSubviews(bgImage,stackViewV)
        stackViewH.axis = .horizontal
        stackViewH.distribution = .fill
        stackViewH.alignment = .center
        stackViewH.spacing = 53
    }
}
