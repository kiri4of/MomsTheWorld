//
//  CGFloat.swift
//  Mum’s the word
//
//  Created by Kiri4of on 26.04.2023.
//

import UIKit

extension CGFloat {
    var adaptedFontSize: CGFloat {
        adapted(dimensionSize: self, to: dimension)
    }
}
