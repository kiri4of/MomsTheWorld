// 
//  SignInViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 08.05.2023.
//

import UIKit

protocol SignInViewControllerProtocol: AnyObject {
    func formatPhoneNumber(formattedPhone: String)
}

final class SignInViewController: BaseViewController<SignInView> {
    
    public var presenter: SignInPresenterProtocol!
    
    override public func viewDidLoad() -> () {
        super.viewDidLoad()
        hideNavigationContoroller()
        mainView.loginTextField.delegate = self
        mainView.delegate = self
    }
}
 
extension SignInViewController: SignInViewProtocol {
    func nextTap() {
        guard
            let text = mainView.loginTextField.text else { return }
        let model = SignInCodeModel(phoneOrEmail: text)
        presenter.routeToCode(text: model)
    }
}

extension SignInViewController: SignInViewControllerProtocol {
    func formatPhoneNumber(formattedPhone: String) {
        mainView.loginTextField.text = formattedPhone
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let fullString = (textField.text ?? "") + string
        print(fullString)
        if let char = fullString.replacingOccurrences(of: "+", with: "").first, char.isNumber {
        presenter.formatNumber(fullString, range.length == 1)
        } else {
            return true
        }
        return true
    }
}
