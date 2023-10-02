//
//  OPTTextField.swift
//  Mum’s the word
//
//  Created by Kiri4of on 11.05.2023.
//

import UIKit

class OTPTextField: UITextField {
    weak var previousTextField: OTPTextField?
    weak var nextTextField: OTPTextField?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override public func deleteBackward(){
        text = ""
        previousTextField?.becomeFirstResponder()
    }
}
