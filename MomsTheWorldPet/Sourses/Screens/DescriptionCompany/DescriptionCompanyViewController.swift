// 
//  DescriptionCompanyViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

protocol DescriptionCompanyViewControllerProtocol: AnyObject {
    
}

final class DescriptionCompanyViewController: BaseViewController<DescriptionCompanyView> {
    
    public var presenter: DescriptionCompanyPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

extension DescriptionCompanyViewController {
    private func configureUI() {
        hideNavigationContoroller()
        mainView.textView.delegate = self
        mainView.delegate = self
    }
    
    private func updateTextViewHeight(textView: UITextView) {
        let mainViewHeight = mainView.bounds.height - 250
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let currentHeight = textView.frame.height
        let newHeight = newSize.height
        
        guard newHeight != currentHeight else { return }
        
        let keyboardHeight = KeyboardManager.shared.getKeyboardHeight()
        print(keyboardHeight)
        let maxViewHeight = mainViewHeight - keyboardHeight
        print(maxViewHeight, newHeight)
        let constrainedHeight = min(maxViewHeight, max(120, newHeight))
        
        UIView.animate(withDuration: 0.05) { [weak self] in
            self?.mainView.textViewHeightConstraint?.update(offset: constrainedHeight)
            self?.mainView.layoutIfNeeded()
        }
    }
}

extension DescriptionCompanyViewController: DescriptionCompanyViewProtocol {
    func routeToBusinessHours() {
        presenter.routeToBusinessHours()
    }
}

extension DescriptionCompanyViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        updateTextViewHeight(textView: textView)
        textView.placeholderLabel?.isHidden = !textView.text.isEmpty
    }
}

extension DescriptionCompanyViewController: DescriptionCompanyViewControllerProtocol {
    
}
