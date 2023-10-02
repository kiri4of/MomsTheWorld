// 
//  SignUpPresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 03.05.2023.
//

import Foundation

protocol SignUpPresenterProtocol: AnyObject {
    func openChooseLoacation(_ model: SignUpModel)
    func setRole(_ role: Roles)
}

final class SignUpPresenter: SignUpPresenterProtocol {
    
    private weak var view: SignUpViewControllerProtocol?
    private var router: SignUpRouter?
    
    private var role: Roles?
    
    init(view: SignUpViewControllerProtocol, router: SignUpRouter) {
        self.view = view
        self.router = router
    }
    
    func openChooseLoacation(_ model: SignUpModel) {
        if let role = role {
            router?.openChooseLoacation(model, role)
        }
    }
    
    func setRole(_ role: Roles) {
        self.role = role
    }
}
