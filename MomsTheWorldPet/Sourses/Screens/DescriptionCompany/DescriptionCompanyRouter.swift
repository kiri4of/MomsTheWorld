// 
//  DescriptionCompanyRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

final class DescriptionCompanyRouter {
    
    private let navigationRouter: NavigationRouterProtocol
        
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func show() {
        let vc = DescriptionCompanyBuilder.build(router: self)
        navigationRouter.showScreen(vc)
    }
    
    func routeToBuisinessHours() {
        let router = BusinessHoursRouter(navigationRouter: navigationRouter)
        router.show()
    }
}
