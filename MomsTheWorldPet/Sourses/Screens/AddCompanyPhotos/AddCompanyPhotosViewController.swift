// 
//  AddCompanyPhotosViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

protocol AddCompanyPhotosViewControllerProtocol: AnyObject {
    func updatePhotos(model: [Photo])
    func changeUIAfterTwoPhoto(willChange: Bool)
}

final class AddCompanyPhotosViewController: BaseViewController<AddCompanyPhotosView> {
    
    public var presenter: AddCompanyPhotosPresenterProtocol!
    private var dataSource: AddControllerDataSource?
    
    override public func viewDidLoad() -> () {
        super.viewDidLoad()
        configureUI()
        createDataSource()
    }
}

extension AddCompanyPhotosViewController {
    private func configureUI() {
        hideNavigationContoroller()
    }
    
    private func createDataSource() {
        dataSource = AddControllerDataSource(collection: mainView.collection, handler: { [weak self] index in
            self?.presenter.remove(indexPath: index)
        })
        mainView.collection.delegate = self
        mainView.delegate = self
        presenter.loadModel()
    }
}

extension AddCompanyPhotosViewController: AddCompanyPhotosViewProtocol {
    func nextTap() {
        presenter.routeToVerified()
    }
}

extension AddCompanyPhotosViewController: AddCompanyPhotosViewControllerProtocol {
    func changeUIAfterTwoPhoto(willChange: Bool) {
        mainView.changeHeader(willChanged: willChange)
    }
    
    func updatePhotos(model: [Photo]) {
        dataSource?.update(model: model)
    }
}

extension AddCompanyPhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.openPicker(index: indexPath)
    }
}

extension AddCompanyPhotosViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        presenter.catchImage(image: image)
    }
}
