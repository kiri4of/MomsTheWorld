// 
//  SearchView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.05.2023.
//

import UIKit

protocol SearchViewProtocol: AnyObject {
    
}

final class SearchView: UIView {
    
    weak var delegate: SearchViewProtocol?
    
    private(set) lazy var searchView = SearchViewCollection()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView {
    private func setupUI() {
        addSubview(searchView)
        
        searchView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(17)
            make.top.equalTo(safeAreaLayoutGuide).inset(152)
        }
    }
}

final class SearchViewCollection: UIView {
    
    private(set) lazy var collection: ResizeCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(
            width: UIScreen.main.bounds.width - (Constants.inset * 4),
            height: Constants.itemHeight
        )
        layout.minimumLineSpacing = Constants.spacing
        layout.sectionInset = UIEdgeInsets(
            top: Constants.inset,
            left: Constants.inset,
            bottom: 0,
            right: Constants.inset
        )
        let collectionView = ResizeCollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        SearchCell.registerWithoutNib(for: collectionView)
        collectionView.alwaysBounceVertical = true

        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchViewCollection {
    private func setupUI() {
        collection.frame = bounds
        addSubview(collection)
        layer.cornerRadius = 16
        backgroundColor = .white
        collection.layer.cornerRadius = 16
        collection.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private enum Constants {
        static let inset: CGFloat = 12
        static let spacing: CGFloat = 8
        static let itemHeight: CGFloat = 52
        static let loginButtonHeight: CGFloat = 44
    }
}
