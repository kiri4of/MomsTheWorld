//
//  BubleLoader.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.04.2023.
//

import UIKit

class BubleLoader: UIImageView {
    
    private var rotationAnimation: CABasicAnimation!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = AppImages.loader
        configureAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func startAnimating() {
        self.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
}

extension BubleLoader {
    private func configureAnimation() {
        rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2.0)
        rotationAnimation.duration = 0.6
        rotationAnimation.repeatCount = .greatestFiniteMagnitude
    }
}
