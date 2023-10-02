//
//  AddCompanyLayout.swift
//  Mum’s the word
//
//  Created by Kiri4of on 22.05.2023.
//

import UIKit

enum NewSectionType: Int, CaseIterable {
    case controller
}

struct AddCompanyLayoutBuilder {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        .init { index, env in
            createLayout(type: .controller)
        }
    }
}

extension AddCompanyLayoutBuilder {
    static private func createLayout(type: NewSectionType) -> NSCollectionLayoutSection {
        let screenWidth = UIScreen.main.bounds.width
        let spacing = 16.Hadapted
        let cellHeight = 201.Vadapted
        let absoluteWidth = (Int(screenWidth) - (3 * Int(spacing))) / 2
        switch type {
        case .controller:
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(CGFloat(absoluteWidth)),
                                                  heightDimension: .absolute(cellHeight))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .absolute(cellHeight + spacing))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitems: [item])
            group.interItemSpacing = .fixed(spacing)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            return section
        }
    }
}

