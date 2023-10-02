//
//  UICollectionVIew + Extension.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.04.2023.
//

import UIKit

extension UICollectionViewCell {
    class func registerWithoutNib(`for` collectionView: UICollectionView) {
        collectionView.register(self.self, forCellWithReuseIdentifier: self.reuseID)
    }

    class func dequeue(_ collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        return unsafeDowncast(collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseID, for: indexPath), to: self)
    }
    
    var indexPath: IndexPath? {
        return next(of: UICollectionView.self)?.indexPath(for: self)
    }
}

extension UICollectionReusableView {
    class func registerWithoutNib(`for` collectionView: UICollectionView, forSupplementaryViewOfKind kind: String) {
        collectionView.register(self, forSupplementaryViewOfKind: kind, withReuseIdentifier: self.reuseID)
    }

    class func dequeue(_ collectionView: UICollectionView, ofKind kind: String, for indexPath: IndexPath) -> Self {
        return unsafeDowncast(collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.reuseID, for: indexPath), to: self)
    }
    
    class var reuseID: String {
        return stringName
    }
    
    fileprivate class var stringName: String {
        return String(describing: self.self)
    }
}

