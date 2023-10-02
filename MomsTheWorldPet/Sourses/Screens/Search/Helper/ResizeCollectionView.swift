//
//  ResizCollectionView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.05.2023.
//

import UIKit
import SnapKit

final class ResizeCollectionView: UICollectionView {
    
    override var contentSize: CGSize {
        didSet {
            fixHeight()
        }
    }
    
    private lazy var heightConstraint: NSLayoutConstraint = {
        let constraint = heightAnchor.constraint(equalToConstant: 0)
        constraint.priority = .defaultLow
        constraint.isActive = true
        return constraint
    }()
    
    private func fixHeight() {
        let constant = UIScreen.main.bounds.height - 196.Vadapted - 28.Vadapted
        var height = collectionViewLayout.collectionViewContentSize.height
        + contentInset.top
        + contentInset.bottom
        + safeAreaInsets.bottom
        
        (collectionViewLayout as? UICollectionViewFlowLayout).map { height += $0.sectionInset.top }
        (collectionViewLayout as? UICollectionViewFlowLayout).map { height += $0.sectionInset.bottom }

        if height != 0 && height != CGFloat.infinity  {
            heightConstraint.constant = min(height,constant)
        }
    }
}
