//
//  SearchLayout.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.05.2023.
//

import UIKit

enum SearchLayoutType: Int, CaseIterable {
    case cities
}

struct SearchLayoutLayoutBuilder {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        .init { index, env in
            createLayout(type: .cities)
        }
    }
}

extension SearchLayoutLayoutBuilder {
    static private func createLayout(type: SearchLayoutType) -> NSCollectionLayoutSection {
        let spacing = 8.Hadapted
        switch type {
        case .cities:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .absolute(52))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .absolute(52))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitems: [item])
            group.interItemSpacing = .fixed(spacing)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            return section
        }
    }
}
