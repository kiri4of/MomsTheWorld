// 
//  CompanyPhoneBuilder.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

final class CompanyPhoneBuilder {
    
    public static func build(
        router: CompanyPhoneRouter
    ) -> CompanyPhoneViewController {
        let view = CompanyPhoneView(.dark)
        let vc = CompanyPhoneViewController(mainView: view)
        let presenter = CompanyPhonePresenter(view: vc, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
    
}
