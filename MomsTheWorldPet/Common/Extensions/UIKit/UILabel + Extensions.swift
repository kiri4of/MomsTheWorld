//
//  UILabel + Extension.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.04.2023.
//

import UIKit

extension UILabel {
    func setGradientText(_ string: String, gradientColors: [UIColor]) {
        if let text = self.text {
            let range = (text as NSString).range(of: string)
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = gradientColors.map { $0.cgColor }
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
            gradientLayer.frame = self.bounds
            let renderer = UIGraphicsImageRenderer(size: gradientLayer.bounds.size)
            let gradientImage = renderer.image { context in
                gradientLayer.render(in: context.cgContext)
            }.cgImage!
            
            let gradientAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(
                    patternImage: UIImage(
                        cgImage: gradientImage,
                        scale: UIScreen.main.scale,
                        orientation: .up
                    )
                ),
                .strokeWidth: -4.0,
                .strokeColor: UIColor.clear
            ]
            
            guard let text = self.text else  { return }
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttributes(gradientAttributes, range: range)
            
            self.attributedText = attributedString
        }
    }
}
