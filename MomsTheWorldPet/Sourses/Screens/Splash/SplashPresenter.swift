// 
//  SplashPresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.04.2023.
//

import Foundation

protocol SplashPresenterProtocol: AnyObject {
    
}

final class SplashPresenter: SplashPresenterProtocol {
    
    private weak var view: SplashViewControllerProtocol?
    private var router: SplashRouter?
    
    init(view: SplashViewControllerProtocol, router: SplashRouter) {
        self.view = view
        self.router = router
    }
}
