//
//  UITextView + Extension.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

extension UITextView {
    func setPadding(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        let insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        textContainerInset = insets
    }
    
    var placeholderLabel: UILabel? {
        return subviews.first(where: { $0 is UILabel }) as? UILabel
    }
    
    func addPlaceholder(_ placeholder: String, withColor color: UIColor = .lightGray) {
        guard placeholderLabel == nil else { return }
        
        let label = UILabel()
        label.text = placeholder
        label.textColor = color
        label.font = font
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 13, y: 16)
        label.isHidden = !text.isEmpty
        
        addSubview(label)
    }
    
    func removePlaceholder() {
        placeholderLabel?.removeFromSuperview()
    }
}
