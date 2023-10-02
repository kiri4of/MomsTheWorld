// 
//  SearchBuilder.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.05.2023.
//

import UIKit

final class SearchBuilder {
    
    public static func build(
        router: SearchRouter
    ) -> SearchViewController {
        let view = SearchView()
        let newtwork = APIManager()
        let vc = SearchViewController(mainView: view)
        let presenter = SearchPresenter(view: vc, router: router, network: newtwork)
        
        vc.presenter = presenter
        
        return vc
    }
    
}
