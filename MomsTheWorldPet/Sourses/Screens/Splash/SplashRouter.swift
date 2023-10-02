// 
//  SplashRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.04.2023.
//

import UIKit

final class SplashRouter {
    
    private var splashWindow: UIWindow?
    var scene: UIWindowScene?
    
    private let navigationRouter: NavigationRouterProtocol
    
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func present() {
        guard let scene = scene else { return }
        splashWindow = UIWindow(windowScene: scene)
        splashWindow?.windowLevel = .normal + 1
        let vc = SplashBuilder.build(router: self)
        splashWindow?.rootViewController = vc
        splashWindow?.overrideUserInterfaceStyle = .light
        splashWindow?.isHidden = false
        splashWindow?.makeKeyAndVisible()
    }
    
    func dismiss(completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.5, animations: {
            self.splashWindow?.alpha = 0
        }) { _ in
            self.splashWindow?.isHidden = true
            self.splashWindow?.rootViewController = nil
            self.splashWindow = nil
            completion?()
        }
    }
}
