// 
//  CompanyPhoneRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

final class CompanyPhoneRouter {
    
    private let navigationRouter: NavigationRouterProtocol
        
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func show() {
        let vc = CompanyPhoneBuilder.build(router: self)
        navigationRouter.showScreen(vc)
    }
    
    func routeToDescriptionCompany() {
        let vc = DescriptionCompanyRouter(navigationRouter: navigationRouter)
        vc.show()
    }
}
