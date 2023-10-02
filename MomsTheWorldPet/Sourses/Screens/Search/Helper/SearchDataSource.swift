//
//  SearchDataSource.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.05.2023.
//

import UIKit

final class SearchDataSource: UICollectionViewDiffableDataSource<Cities,CityElement> {
    
    init(collection: UICollectionView, handler: @escaping (IndexPath) -> () ) {
        super.init(collectionView: collection) { collectionView, indexPath, itemIdentifier in
            let cell = SearchCell.dequeue(collectionView, for: indexPath)
            cell.configure(model: itemIdentifier)
//            cell.crossDidTap = { index in handler(index) }
            return cell
        }
    }
    
    func update(model: [CityElement]) {
        var snapshot = snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([.city])
        snapshot.appendItems(model,toSection: .city)
        apply(snapshot,animatingDifferences: false)
    }
}
