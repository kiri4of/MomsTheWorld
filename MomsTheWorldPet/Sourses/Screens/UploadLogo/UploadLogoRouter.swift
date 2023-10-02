// 
//  UploadLogoRouter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 13.05.2023.
//

import UIKit

final class UploadLogoRouter: NSObject, UINavigationControllerDelegate {
    
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
        let vc = UploadLogoBuilder.build(coordinator: self)
        picker.delegate = vc
        navigationRouter.showScreen(vc)
    }
    
    func openPicker() {
        navigationRouter.present(picker)
    }
    
    func dismisPiker() {
        navigationRouter.dismissModalScreen()
    }
    
    func routeToCompanyPhotos() {
        let router = AddCompanyPhotosRouter(navigationRouter: navigationRouter)
        router.show()
    }
}
