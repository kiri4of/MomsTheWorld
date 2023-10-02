// 
//  AddCompanyPhotosModel.swift
//  Mum’s the word
//
//  Created by Kiri4of on 19.05.2023.
//

import UIKit

enum CompanyPhotos: Hashable {
    case photos
}

struct CompanyPhotosModel: Hashable {
        
    var photos: [Photo]
    
    var isTwoPhotoAdd: Bool {
        return photos.count >= 2 && photos.allSatisfy({$0.currentType == .fill })
    }
    
    var isFilledTwoPhotos: Bool {
        return photos.count > 2 
    }
    
    var isFilledOnlyTwoPhotos: Bool {
        return photos.count == 3
    }
}

struct Photo: Hashable {
    
    enum Filled {
        case fill
        case empty
        case add
    }
    
    let id = UUID().uuidString
    var image: UIImage?
    
    var currentType: Filled {
        return image == nil ? .empty : .fill
    }
}


