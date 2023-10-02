// 
//  OnboardingViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.04.2023.
//

import UIKit
import Hero

protocol OnboardingViewControllerProtocol: AnyObject {
    
}

final class OnboardingViewController: BaseViewController<OnboardingView> {
    
    public var presenter: OnboardingPresenterProtocol!
    private var isNotEnd = true
    
    override public func viewDidLoad() -> () {
        super.viewDidLoad()
        configureUI()
        targets()
    }
    
    private func configureUI() {
        hideNavigationContoroller()
        self.hero.isEnabled = true
    }
    
    private func targets() {
        mainView.delegate = self
    }
}

extension OnboardingViewController: OnboardingViewProtocol {
    func lastPage() {
        if isNotEnd {
            presenter.routeToStart()
            isNotEnd = false
        }
    }
}
 
extension OnboardingViewController: OnboardingViewControllerProtocol {
    
}

extension UIViewController {
    func hideNavigationContoroller() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.isUserInteractionEnabled = false
        navigationController?.navigationBar.backgroundColor = .red
    }
}
