//
//  RoleButtonModel.swift
//  Mum’s the word
//
//  Created by Kiri4of on 30.04.2023.
//

import UIKit

struct RoleButtonModel {
    let title: String
    let desc: String
    let image: UIImage?
    let type: Roles
}

enum Roles {
    case parent
    case business
    
    func getModel() -> RoleButtonModel {
        switch self {
        case .parent:
            return RoleButtonModel(
                title: AppStrings.parenRole,
                desc: AppStrings.mockRoleDesc,
                image: AppImages.parenRole, type: self)
        case .business:
            return RoleButtonModel(
                title: AppStrings.businessRole,
                desc: AppStrings.mockRoleDesc,
                image: AppImages.businessRole, type: self)
        }
    }
}
