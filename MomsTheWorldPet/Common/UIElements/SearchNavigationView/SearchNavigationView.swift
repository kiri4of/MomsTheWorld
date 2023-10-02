//
//  SearchNavigationView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 23.05.2023.
//

import UIKit

final class SearchNavigationView: UIView {
    
    var backDidTap: (() -> ())?
    var searchDidTap: (() -> ())?
    
    enum TypeOfSearchView {
        case dark
        case light
    }
    
    private(set) lazy var backNavigationView = BackNavigationView()
    private(set) lazy var searchView = SearchFrView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(type: TypeOfSearchView) {
        switch type {
        case .dark:
            self.backgroundColor = .clear
            searchView.backgroundColor = .white
            searchView.layer.borderWidth = 0
            backNavigationView.title.textColor = .white
        case .light:
            self.backgroundColor = .white
            searchView.layer.borderWidth = 2
            backNavigationView.title.textColor = .black
        }
    }
}

extension SearchNavigationView {
    private func setupUI() {
        addSubview(backNavigationView)
        addSubview(searchView)
        
        backNavigationView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalTo(56)
        }
        
        searchView.snp.makeConstraints { make in
            make.top.equalTo(backNavigationView.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48.Vadapted)
        }
        
        configureUI()
    }
    
    private func configureUI() {
        backNavigationView.backTap = { [weak self] in
            self?.backDidTap?()
        }
        
        searchView.searchTap = { [weak self] in
            self?.searchDidTap?()
        }
    }
}
