//
//  BaseViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.04.2023.
//

import UIKit
import Hero

class BaseViewController<View: UIView>: UIViewController {
    private(set) var keyboardManager = KeyboardManager.shared
    let mainView: View!
    
    init(mainView: View) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        keyboardManager.startObservingTapOutsideKeyboard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    deinit {
        keyboardManager.stopObservingTapOutsideKeyboard()
    }
}
