// 
//  UploadLogoViewController.swift
//  Mum’s the word
//
//  Created by Kiri4of on 13.05.2023.
//

import UIKit

protocol UploadLogoViewControllerProtocol: AnyObject {
    func updateLogoImage(image: UIImage)
}

final class UploadLogoViewController: BaseViewController<UploadLogoView> {
    
    public var presenter: UploadLogoPresenterProtocol!
    
    override public func viewDidLoad() -> () {
        super.viewDidLoad()
        hideNavigationContoroller()
        addTarget()
    }
    
    private func addTarget() {
        mainView.delegate = self
        mainView.chooseLogoView.handler = { [weak self] in
            self?.presenter.openPicker()
        }
    }
}

extension UploadLogoViewController: UploadLogoViewControllerProtocol {
    func updateLogoImage(image: UIImage) {
        mainView.chooseLogoView.updateView(uiimage: image)
        mainView.card.update(image: image)
    }
}

extension UploadLogoViewController: UploadLogoViewProtocol {
    func openCompanyPhotos() {
        presenter.routeToCompanyPhotos()
    }
}

extension UploadLogoViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        presenter.catchImage(image: image)
    }
}
