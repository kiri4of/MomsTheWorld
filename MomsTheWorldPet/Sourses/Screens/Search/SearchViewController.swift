// 
//  SearchViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.05.2023.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {
    func updateUI(model: [CityElement])
}

final class SearchViewController: BaseViewController<SearchView> {
    
    public var presenter: SearchPresenterProtocol!
    private lazy var navView = SearchNavigationView()
    private var dataSource: SearchDataSource?
    private var searchText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Установите прозрачный фон контроллера
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.isOpaque = false
        setupNavigationView()
    }
}

extension SearchViewController {
    private func setupNavigationView() {
        mainView.addSubview(navView)
        navView.backNavigationView.updateTitle()
        navView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(193.Vadapted)
        }
        navView.updateUI(type: .dark)
        
        navView.backDidTap = { [weak self] in
            
        }
        
        navView.searchView.search = { [weak self] text in
            self?.searchText = text
            if text.isEmpty {
                self?.dataSource?.update(model: [])
                self?.mainView.searchView.isHidden = true
            } else {
                self?.presenter.searchCity(with: text)
            }
        }
        
        createDataSource()
    }
    
    private func createDataSource() {
        dataSource = SearchDataSource(collection: mainView.searchView.collection, handler: { [weak self] index in
            //self?.presenter.remove(indexPath: index)
        })
        mainView.searchView.isHidden = true
    }
}

extension SearchViewController: SearchViewControllerProtocol {
    func updateUI(model: [CityElement]) {
        if !searchText.isEmpty {
            dataSource?.update(model: model)
            mainView.searchView.isHidden = model.isEmpty
        }
    }
}
