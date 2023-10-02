// 
//  StartScreenBuilder.swift
//  Mum’s the word
//
//  Created by Kiri4of on 27.04.2023.
//

import UIKit

final class StartScreenBuilder {
    
    public static func build(
        router: StartScreenRouter
    ) -> StartScreenViewController {
        let view = StartScreenView()
        let vc = StartScreenViewController(mainView: view)
        let presenter = StartScreenPresenter(view: vc, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
    
}
