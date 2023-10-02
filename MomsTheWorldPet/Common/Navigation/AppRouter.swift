//
//  AppRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.04.2023.
//

import UIKit

final class AppRouter {
    private let navigationRouter: NavigationRouterProtocol
    private lazy var splashRouter: SplashRouter? = SplashRouter(navigationRouter: navigationRouter)
        
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
}

extension AppRouter {
    func showOnboarding() {
//        let router = LocationMapRouter(navigationRouter: navigationRouter)
//        router.show()
        let router = OnboardingRouter(navigationRouter: navigationRouter)
        router.showOnboarding()
    }
    
    func showStart() {
        let router = StartScreenRouter(navigationRouter: navigationRouter)
        router.show()
    }
    
    func showSplash(scene: UIWindowScene, completion: @escaping () -> ()) {
        splashRouter?.scene = scene
        splashRouter?.present()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            completion()
            self.splashRouter?.dismiss(completion: { [weak self] in
                self?.splashRouter = nil
                
            })
        }
    }
}
