// 
//  SignUpBuilder.swift
//  Mum’s the word
//
//  Created by Kiri4of on 03.05.2023.
//

import UIKit

final class SignUpBuilder {
    
    public static func build(
        router: SignUpRouter, _ role: Roles
    ) -> SignUpViewController {
        let view = SignUpView(role: role, .dark)
        let vc = SignUpViewController(mainView: view)
        let presenter = SignUpPresenter(view: vc, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
    
}
