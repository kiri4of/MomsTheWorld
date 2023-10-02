// 
//  CompanyPhoneViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

protocol CompanyPhoneViewControllerProtocol: AnyObject {
    
}

final class CompanyPhoneViewController: BaseViewController<CompanyPhoneView> {
    
    public var presenter: CompanyPhonePresenterProtocol!
    
    override public func viewDidLoad() -> () {
        super.viewDidLoad()
        configureUI()
    }
}

extension CompanyPhoneViewController {
    private func configureUI() {
        mainView.delegate = self
    }
}

extension CompanyPhoneViewController: CompanyPhoneViewControllerProtocol {
    
}

extension CompanyPhoneViewController: CompanyPhoneViewProtocol {
    func nextTap() {
        presenter.routeToDescriptionCompany()
    }
}
