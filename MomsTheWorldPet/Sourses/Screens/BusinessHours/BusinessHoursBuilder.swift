// 
//  BusinessHoursBuilder.swift
//  Mum’s the word
//
//  Created by Kiri4of on 16.05.2023.
//

import UIKit

final class BusinessHoursBuilder {
    
    public static func build(
        router: BusinessHoursRouter
    ) -> BusinessHoursViewController {
        let view = BusinessHoursView(.dark)
        let vc = BusinessHoursViewController(mainView: view)
        let presenter = BusinessHoursPresenter(view: vc, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
    
}
