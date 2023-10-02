// 
//  CompanyPhonePresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import Foundation

protocol CompanyPhonePresenterProtocol: AnyObject {
    func routeToDescriptionCompany()
}

final class CompanyPhonePresenter: CompanyPhonePresenterProtocol {
    
    private weak var view: CompanyPhoneViewControllerProtocol?
    private var router: CompanyPhoneRouter?
    
    init(view: CompanyPhoneViewControllerProtocol, router: CompanyPhoneRouter) {
        self.view = view
        self.router = router
    }
    
    func routeToDescriptionCompany() {
        router?.routeToDescriptionCompany()
    }
}
