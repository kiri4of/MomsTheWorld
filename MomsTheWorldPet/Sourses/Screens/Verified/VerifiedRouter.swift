// 
//  VerifiedRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 18.05.2023.
//

import UIKit

final class VerifiedRouter {
    
    private let navigationRouter: NavigationRouterProtocol
        
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func show() {
        let vc = VerifiedBuilder.build(router: self)
        navigationRouter.showScreen(vc)
    }
}
