// 
//  BusinessHoursPresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 16.05.2023.
//

import Foundation

protocol BusinessHoursPresenterProtocol: AnyObject {
    func routeToLogo()
}

final class BusinessHoursPresenter: BusinessHoursPresenterProtocol {
    
    private weak var view: BusinessHoursViewControllerProtocol?
    private var router: BusinessHoursRouter?
    
    init(view: BusinessHoursViewControllerProtocol, router: BusinessHoursRouter) {
        self.view = view
        self.router = router
    }
    
    func routeToLogo() {
        router?.routeToChooseLogo()
    }
}
