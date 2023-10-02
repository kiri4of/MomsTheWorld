// 
//  BusinessHoursViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 16.05.2023.
//

import UIKit

protocol BusinessHoursViewControllerProtocol: AnyObject {
    
}

final class BusinessHoursViewController: BaseViewController<BusinessHoursView> {
    
    let datePicker = CustomTimePicker()
    
    public var presenter: BusinessHoursPresenterProtocol!
    
    override public func viewDidLoad() -> () {
        super.viewDidLoad()
        configureUI()
    }
}

extension BusinessHoursViewController {
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        mainView.delegate = self
    }
}

extension BusinessHoursViewController: BusinessHoursViewProtocol {
    func routeToLogo() {
        presenter.routeToLogo()
    }
}

extension BusinessHoursViewController: BusinessHoursViewControllerProtocol {
    
}

