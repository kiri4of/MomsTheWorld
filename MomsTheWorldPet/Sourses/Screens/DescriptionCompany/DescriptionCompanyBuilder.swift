// 
//  DescriptionCompanyBuilder.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

final class DescriptionCompanyBuilder {
    
    public static func build(
        router: DescriptionCompanyRouter
    ) -> DescriptionCompanyViewController {
        let view = DescriptionCompanyView(.dark)
        let vc = DescriptionCompanyViewController(mainView: view)
        let presenter = DescriptionCompanyPresenter(view: vc, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
    
}
