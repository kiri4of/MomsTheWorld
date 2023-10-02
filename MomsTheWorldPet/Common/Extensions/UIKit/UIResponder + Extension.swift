//
//  UIResponder + Extension.swift
//  Mum’s the word
//
//  Created by Kiri4of on 23.05.2023.
//

import UIKit

extension UIResponder {
    func next<Responder: UIResponder>(of type: Responder.Type = Responder.self) -> Responder? {
        return self.next.flatMap({ $0 as? Responder ?? $0.next() })
    }
}

