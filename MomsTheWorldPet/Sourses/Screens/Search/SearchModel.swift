// 
//  SearchModel.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.05.2023.
//

import UIKit

// MARK: - CityElement
struct CityElement: Codable, Hashable {
    let id, name: String?
    let latitude, longitude: Double?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum Cities {
    case city
}



