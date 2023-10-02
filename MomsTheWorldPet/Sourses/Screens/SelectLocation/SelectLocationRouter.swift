// 
//  SelectLocationRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 05.05.2023.
//

import UIKit

final class SelectLocationRouter {
    
    private let navigationRouter: NavigationRouterProtocol
     
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func show(_ model: SignUpModel,_ role: Roles) {
        let vc = SelectLocationBuilder.build(router: self, role)
        vc.presenter.setSignUpModel(model: model)
        vc.presenter.setRole(role)
        navigationRouter.showScreen(vc)
    }
    
    func routeToEnterCompanyPhone() {
        navigationRouter.chooseAnimationTransition(type: .fade)
        let router = CompanyPhoneRouter(navigationRouter: navigationRouter)
        router.show()
    }
    
    func routeToVerified() {
        navigationRouter.chooseAnimationTransition(type: .fade)
        let router = VerifiedRouter(navigationRouter: navigationRouter)
        router.show()
    }
    
    func routeToLocation() {
        navigationRouter.chooseAnimationTransition(type: .slide(direction: .left))
        let router = LocationMapRouter(navigationRouter: navigationRouter)
        router.show()
    }
}
