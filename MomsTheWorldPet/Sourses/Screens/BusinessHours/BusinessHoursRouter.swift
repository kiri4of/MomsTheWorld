// 
//  BusinessHoursRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 16.05.2023.
//

import UIKit

final class BusinessHoursRouter {
    
    private let navigationRouter: NavigationRouterProtocol
        
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func show() {
        let vc = BusinessHoursBuilder.build(router: self)
        navigationRouter.showScreen(vc)
    }
    
    func routeToChooseLogo() {
        let router = UploadLogoRouter(navigationRouter: navigationRouter)
        router.show()
    }
}
