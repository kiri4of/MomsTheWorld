// 
//  VerifiedBuilder.swift
//  Mum’s the word
//
//  Created by Kiri4of on 18.05.2023.
//

import UIKit

final class VerifiedBuilder {
    
    public static func build(
        router: VerifiedRouter
    ) -> VerifiedViewController {
        let view = VerifiedView(.dark)
        let vc = VerifiedViewController(mainView: view)
        let presenter = VerifiedPresenter(view: vc, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
    
}
