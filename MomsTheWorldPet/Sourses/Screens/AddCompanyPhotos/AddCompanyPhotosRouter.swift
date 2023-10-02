// 
//  AddCompanyPhotosRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

final class AddCompanyPhotosRouter {
    
    private let navigationRouter: NavigationRouterProtocol
    
    private lazy var picker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
       return picker
    }()
        
    init(navigationRouter: NavigationRouterProtocol) {
        self.navigationRouter = navigationRouter
    }
    
    func show() {
        let vc = AddCompanyPhotosBuilder.build(router: self)
        picker.delegate = vc
        navigationRouter.showScreen(vc)
    }
    
    func openPicker() {
        navigationRouter.present(picker)
    }
    
    func dismisPiker() {
        navigationRouter.dismissModalScreen()
    }
    
    func routeToVerified() {
        let router = VerifiedRouter(navigationRouter: navigationRouter)
        router.show()
    }
}
