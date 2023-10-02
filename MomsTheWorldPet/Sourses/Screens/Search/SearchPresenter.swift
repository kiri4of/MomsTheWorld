//
//  SearchPresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.05.2023.
//

import Foundation

protocol SearchPresenterProtocol: AnyObject {
    func searchCity(with text: String)
}

final class SearchPresenter: SearchPresenterProtocol {
    
    typealias ModelFromRequest = APIResult<[CityElement]>
    
    private weak var view: SearchViewControllerProtocol?
    private var router: SearchRouter?
    private let network: APIManagerProtocol
    
    init(view: SearchViewControllerProtocol,
         router: SearchRouter, network: APIManagerProtocol) {
        self.view = view
        self.router = router
        self.network = network
    }
    
    func pop() {
        
    }
    
    func searchCity(with text: String) {
        network.makeRequest(for: SearchEndpoint.searchCity(searchText: text)) { [weak self]
            (result: ModelFromRequest) in
            switch result {
            case .success(let response):
                    self?.view?.updateUI(model: response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
