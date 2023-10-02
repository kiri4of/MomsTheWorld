//
//  Array + Extension.swift
//  Mum’s the word
//
//  Created by Kiri4of on 26.04.2023.
//

import Foundation

extension Array where Element == Int {
    var VResized: CGSize {
        guard self.count == 2 else { fatalError() }
        return resized(size: CGSize(width: self[0], height: self[1]), basedOn: .height)
    }
    
    var HResized: CGSize {
        guard self.count == 2 else { fatalError() }
        return resized(size: CGSize(width: self[0], height: self[1]), basedOn: .width)
    }
}
