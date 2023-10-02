// 
//  AddCompanyPhotosPresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

protocol AddCompanyPhotosPresenterProtocol: AnyObject {
    func loadModel()
    func catchImage(image: UIImage)
    func openPicker(index: IndexPath)
    func routeToVerified()
    func remove(indexPath: IndexPath)
}

final class AddCompanyPhotosPresenter: AddCompanyPhotosPresenterProtocol {
    
    private weak var view: AddCompanyPhotosViewControllerProtocol?
    private var router: AddCompanyPhotosRouter?
    private var model: CompanyPhotosModel!
    private var previosIndexPath: IndexPath?
    
    init(view: AddCompanyPhotosViewControllerProtocol, router: AddCompanyPhotosRouter) {
        self.view = view
        self.router = router
    }
    
    func loadModel() {
        model = CompanyPhotosModel(photos: [Photo(image: nil), Photo(image: nil)])
        if let model {
            view?.updatePhotos(model: model.photos)
        }
    }
    
    func openPicker(index: IndexPath) {
        self.previosIndexPath = index
        router?.openPicker()
    }
    
    func catchImage(image: UIImage) {
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        guard
            let index = previosIndexPath?.row else { return }
        self.model.photos[index].image = image
        
        view?.changeUIAfterTwoPhoto(willChange: model.isTwoPhotoAdd)
        
        if model.isTwoPhotoAdd {
            self.model.photos.append(Photo(image: nil))
        }
        
        view?.updatePhotos(model: model.photos)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        dismisPiker()
    }
    
    func dismisPiker() {
        router?.dismisPiker()
    }
    
    func routeToVerified() {
        router?.routeToVerified()
    }
    
    func remove(indexPath: IndexPath) {
        let endIndex = model.photos.count - 1
        let indexRangeFlag = !((0...1).contains(indexPath.row))
        if model.isFilledTwoPhotos && indexRangeFlag {
            let index = model.photos.index(before: endIndex)
            model.photos.remove(at: index)
        } else if model.isFilledOnlyTwoPhotos {
            model.photos.remove(at: endIndex)
            model.photos[indexPath.row].image = nil
        } else {
            model.photos[indexPath.row].image = nil
        }
        view?.changeUIAfterTwoPhoto(willChange: model.isTwoPhotoAdd)
        view?.updatePhotos(model: model.photos)
    }
        
    private
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
