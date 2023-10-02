// 
//  SelectLocationBuilder.swift
//  Mum’s the word
//
//  Created by Kiri4of on 05.05.2023.
//

import UIKit

final class SelectLocationBuilder {
    
    public static func build(
        router: SelectLocationRouter, _ role: Roles
    ) -> SelectLocationViewController {
        let view = SelectLocationView(role: role, .dark)
        let vc = SelectLocationViewController(mainView: view)
        let presenter = SelectLocationPresenter(view: vc, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
    
}
