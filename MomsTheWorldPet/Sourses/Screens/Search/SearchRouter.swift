// 
//  SearchRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.05.2023.
//

import UIKit

final class SearchRouter {
    
    private let navigationRouter: NavigationRouterProtocol
        
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func show() {
        navigationRouter.chooseAnimationTransition(type: .fade)
        let vc = SearchBuilder.build(router: self)
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        navigationRouter.present(vc)
    }
}
