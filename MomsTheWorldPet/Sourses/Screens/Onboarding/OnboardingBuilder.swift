// 
//  OnboardingBuilder.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.04.2023.
//

import UIKit

final class OnboardingBuilder {
    
    public static func build(
        router: OnboardingRouter
    ) -> OnboardingViewController {
        let view = OnboardingView()
        let vc = OnboardingViewController(mainView: view)
        let presenter = OnboardingPresenter(view: vc, router: router)
        vc.presenter = presenter
        return vc
    }
    
}
