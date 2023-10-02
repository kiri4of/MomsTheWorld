// 
//  SelectLocationPresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 05.05.2023.
//

import Foundation

protocol SelectLocationPresenterProtocol: AnyObject {
    func setSignUpModel(model: SignUpModel)
    func setRole(_ role: Roles)
    func routeToNextScreen(role: Roles)
    func routeToLocationScreen()
}

final class SelectLocationPresenter: SelectLocationPresenterProtocol {
    
    private weak var view: SelectLocationViewControllerProtocol?
    private var router: SelectLocationRouter?
    
    private var role: Roles?
    
    init(view: SelectLocationViewControllerProtocol, router: SelectLocationRouter) {
        self.view = view
        self.router = router
    }
    
    func setSignUpModel(model: SignUpModel) {
        view?.updateName(name: model.name)
    }
    
    func setRole(_ role: Roles) {
        self.role = role
    }
    
    func routeToNextScreen(role: Roles) {
        switch role {
        case .parent:
            router?.routeToVerified()
        case .business:
            router?.routeToEnterCompanyPhone()
        }
    }
    
    func routeToLocationScreen() {
        router?.routeToLocation()
    }
}
