// 
//  RoleViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 29.04.2023.
//

import UIKit

protocol RoleViewControllerProtocol: AnyObject {
    
}

final class RoleViewController: BaseViewController<RoleView> {
    
    public var presenter: RolePresenterProtocol!
    
    override public func viewDidLoad() -> () {
        super.viewDidLoad()
        hideNavigationContoroller()
        configureUI()
    }
    
    private func configureUI() {
        mainView.delegate = self
    }
}

extension RoleViewController: RoleViewProtocol {
    func getRole(_ role: Roles) {
        presenter.setRole(role)
    }
    
    func routeToLogin() {
        presenter.routeToSignIn()
    }
    
    func routeToSignUP() {
        presenter.routeToSignUP()
    }    
}

extension RoleViewController: RoleViewControllerProtocol {
    
}
