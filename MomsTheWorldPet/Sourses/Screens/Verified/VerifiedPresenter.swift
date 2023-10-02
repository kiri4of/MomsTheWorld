// 
//  VerifiedPresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 18.05.2023.
//

import Foundation

protocol VerifiedPresenterProtocol: AnyObject {
    
}

final class VerifiedPresenter: VerifiedPresenterProtocol {
    
    private weak var view: VerifiedViewControllerProtocol?
    private var router: VerifiedRouter?
    
    init(view: VerifiedViewControllerProtocol, router: VerifiedRouter) {
        self.view = view
        self.router = router
    }
}
