//
//  NavigationRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.04.2023.
//

import UIKit
import Hero

class NavigationRouter: NavigationRouterProtocol {
    
    enum Route {
        case push
        case pop(vc: UIViewController)
    }
   
    private(set) weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func showScreen(_ viewController: UIViewController) {
        viewController.isHeroEnabled = true
        navigationController?.isHeroEnabled = true
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func showModalScreen(_ viewController: UIViewController) {
        navigationController?.present(viewController, animated: true, completion: nil)
    }
    
    func dismissModalScreen() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func chooseAnimationTransition(type: HeroDefaultAnimationType) {
        navigationController?.heroNavigationAnimationType = type
    }
    
    func changeStack(_ viewController: UIViewController) {
        if let navigationController = self.navigationController {
            chooseAnimationTransition(type: .fade)
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    func present(_ viewController: UIViewController) {
        navigationController?.present(viewController, animated: true)
    }
}
