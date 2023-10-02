// 
//  UploadLogoPresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 13.05.2023.
//

import UIKit

protocol UploadLogoPresenterProtocol: AnyObject {
    func catchImage(image: UIImage)
    func openPicker()
    func routeToCompanyPhotos()
}

final class UploadLogoPresenter: NSObject,UploadLogoPresenterProtocol {
    
    private weak var view: UploadLogoViewControllerProtocol?
    private var router: UploadLogoRouter?
    
    init(view: UploadLogoViewControllerProtocol, router: UploadLogoRouter) {
        self.view = view
        self.router = router
    }
    
    func openPicker() {
        router?.openPicker()
    }
    
    func catchImage(image: UIImage) {
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        view?.updateLogoImage(image: image)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        dismisPiker()
    }
    
    func dismisPiker() {
        router?.dismisPiker()
    }
    
    func routeToCompanyPhotos() {
        router?.routeToCompanyPhotos()
    }
        
    private
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
