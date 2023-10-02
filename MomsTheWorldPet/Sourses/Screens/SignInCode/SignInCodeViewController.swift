// 
//  SignInCodeViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 11.05.2023.
//

import UIKit

protocol SignInCodeViewControllerProtocol: AnyObject {
    func updateDesc(_ model: String)
}

final class SignInCodeViewController: BaseViewController<SignInCodeView> {
    
    public var presenter: SignInCodePresenterProtocol!
    
    override public func viewDidLoad() -> () {
        super.viewDidLoad()
        hideNavigationContoroller()
    }
}

extension SignInCodeViewController: SignInCodeViewControllerProtocol {
    func updateDesc(_ model: String) {
        mainView.update(text: model)
    }
}
