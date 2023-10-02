//
//  OnboardingRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.04.2023.
//

import UIKit

final class OnboardingRouter {
    private let navigationRouter: NavigationRouterProtocol
        
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func showOnboarding() {
        let vc = OnboardingBuilder.build(router: self)
        navigationRouter.showScreen(vc)
    }
    
    func showStart() {
        let startRouter = StartScreenRouter(navigationRouter: navigationRouter)
        startRouter.show()
    }
}
