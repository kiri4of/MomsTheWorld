//
//  KeyboardManager.swift
//  Mum’s the word
//
//  Created by Kiri4of on 20.05.2023.
//

import UIKit

class KeyboardManager {
    static let shared = KeyboardManager()
    
    private var keyboardHeight: CGFloat = 0.0
    private var tapGestureRecognizer: UITapGestureRecognizer?
    
    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func startObservingTapOutsideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutsideKeyboard(_:)))
        tapGesture.cancelsTouchesInView = false
        tapGestureRecognizer = tapGesture
        
        UIApplication.shared.windows.first?.addGestureRecognizer(tapGesture)
    }
    
    func stopObservingTapOutsideKeyboard() {
        if let tapGestureRecognizer = tapGestureRecognizer {
            UIApplication.shared.windows.first?.removeGestureRecognizer(tapGestureRecognizer)
        }
        tapGestureRecognizer = nil
    }
    
    @objc private func keyboardWillChangeFrame(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            if keyboardFrame.origin.y >= UIScreen.main.bounds.height {
                // Клавиатура не отображается, сбрасываем значение высоты клавиатуры
                keyboardHeight = 0.0
            } else {
                // Высота клавиатуры равна разнице между высотой экрана и Y-координатой клавиатуры
                keyboardHeight = UIScreen.main.bounds.height - keyboardFrame.origin.y
            }
        }
    }
    
    @objc private func handleTapOutsideKeyboard(_ gestureRecognizer: UITapGestureRecognizer) {
        UIApplication.shared.windows.first?.endEditing(true)
    }
    
    func getKeyboardHeight() -> CGFloat {
        return keyboardHeight
    }
}
