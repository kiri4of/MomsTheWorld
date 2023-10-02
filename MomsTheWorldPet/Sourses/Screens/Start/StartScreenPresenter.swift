// 
//  StartScreenPresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 27.04.2023.
//

import Foundation

protocol StartScreenPresenterProtocol: AnyObject {
    func routeToLogin()
    func routeToNextStep() 
}

final class StartScreenPresenter: StartScreenPresenterProtocol {
    
    private weak var view: StartScreenViewControllerProtocol?
    private var router: StartScreenRouter?
    
    init(view: StartScreenViewControllerProtocol, router: StartScreenRouter) {
        self.view = view
        self.router = router
    }
    
    func routeToLogin() {
        router?.routeLogin()
    }
    
    func routeToNextStep() {
        router?.routeNextStep()
    }
}
