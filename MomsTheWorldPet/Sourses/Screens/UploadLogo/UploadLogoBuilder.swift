// 
//  UploadLogoBuilder.swift
//  Mum’s the word
//
//  Created by Kiri4of on 13.05.2023.
//

import UIKit

final class UploadLogoBuilder {
    
    public static func build(
        coordinator: UploadLogoRouter
    ) -> UploadLogoViewController {
        let view = UploadLogoView(.dark)
        let vc = UploadLogoViewController(mainView: view)
        let presenter = UploadLogoPresenter(view: vc, router: coordinator)
        
        vc.presenter = presenter
        
        return vc
    }
    
}
