// 
//  SplashViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.04.2023.
//

import UIKit

protocol SplashViewControllerProtocol: AnyObject {
    
}

final class SplashViewController: BaseViewController<SplashView> {
    
    public var presenter: SplashPresenterProtocol!
    
    override public func viewDidLoad() -> () {
        super.viewDidLoad()
    }
}

extension SplashViewController: SplashViewControllerProtocol {
    
}
