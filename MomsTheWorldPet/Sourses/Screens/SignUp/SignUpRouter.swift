// 
//  SignUpRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 03.05.2023.
//

import UIKit

final class SignUpRouter {
    
    private let navigationRouter: NavigationRouterProtocol
        
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func show(_ role: Roles) {
        let vc = SignUpBuilder.build(router: self, role)
        vc.presenter.setRole(role)
        navigationRouter.showScreen(vc)
    }
    
    func openChooseLoacation(_ model: SignUpModel, _ role: Roles) {
        let router = SelectLocationRouter(navigationRouter: navigationRouter)
        router.show(model,role)
    }
}
