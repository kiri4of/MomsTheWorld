// 
//  RolePresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 29.04.2023.
//

import Foundation

protocol RolePresenterProtocol: AnyObject {
    func routeToSignUP()
    func routeToSignIn()
    func setRole(_ role: Roles)
}

final class RolePresenter: RolePresenterProtocol {
    
    private weak var view: RoleViewControllerProtocol?
    private var router: RoleRouter?
    
    private var role: Roles?
    
    init(view: RoleViewControllerProtocol, router: RoleRouter) {
        self.view = view
        self.router = router
    }
    
    func routeToSignUP() {
        if let role = role {
            router?.routeToSignUP(role)
        }
    }
    
    func routeToSignIn() {
        router?.routeToSignIn()
    }
    
    func setRole(_ role: Roles) {
        self.role = role
    }
}
