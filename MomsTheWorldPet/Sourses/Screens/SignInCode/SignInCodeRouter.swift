// 
//  SignInCodeRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 11.05.2023.
//

import UIKit

final class SignInCodeRouter {
    
    private let navigationRouter: NavigationRouterProtocol
        
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func show(_ model: SignInCodeModel) {
        let vc = SignInCodeBuilder.build(router: self)
        vc.presenter.setSignInModel(model: model)
        navigationRouter.showScreen(vc)
    }
}
