//
//  WelcomeRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 26.04.2023.
//

import Foundation
import Hero

final class WelcomeRouter {
    private let navigationRouter: NavigationRouterProtocol
        
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func showOnboarding() {
        let vc = WelcomeViewController()
        navigationRouter.showScreen(vc)
        dismiss()
    }
    
    func dismiss() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [self] in
            let router = OnboardingRouter(navigationRouter: navigationRouter)
            navigationRouter.chooseAnimationTransition(type: .push(direction: .left))
            router.showOnboarding()
        }
    }
}

