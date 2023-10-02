// 
//  SignInPresenter.swift
//  Mum’s the word
//
//  Created by Kiri4of on 08.05.2023.
//

import Foundation

protocol SignInPresenterProtocol: AnyObject {
    func formatNumber(
        _ phoneNumber: String,
        _ removeLast: Bool
    )
    
    func routeToCode(text: SignInCodeModel) 
}

final class SignInPresenter: SignInPresenterProtocol {
    
    private weak var view: SignInViewControllerProtocol?
    private var router: SignInRouter?
    
    init(view: SignInViewControllerProtocol, router: SignInRouter) {
        self.view = view
        self.router = router
    }
    
    func routeToCode(text: SignInCodeModel) {
        router?.routeToCode(text: text)
    }
    
    func formatNumber(
        _ phoneNumber: String,
        _ removeLast: Bool
    ) {
        let pattern = "[\\+\\s-]"
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        do {
            let reg = try NSRegularExpression(
                pattern: pattern,
                options: .caseInsensitive
            )
            
            var number = reg.stringByReplacingMatches(
                in: phoneNumber,
                range: range,
                withTemplate: ""
            )
            
            let maxNumbers = Phones.US.maxNumber
            let startIndex = number.startIndex
            
            if number.count > maxNumbers {
                let endIndex = number.index(startIndex, offsetBy: maxNumbers)
                number = String(number[startIndex..<endIndex])
            }
            
            if removeLast {
                let endIndex = number.index(startIndex, offsetBy: number.count - 1)
                number = String(number[startIndex..<endIndex])
            }
            
            let endIndex = number.index(startIndex, offsetBy: number.count)
            let range = startIndex..<endIndex
            
            if number.count < 7 {
                let pattern = "(\\d)(\\d{3})(\\d+)"
                number = number.replacingOccurrences(of: pattern, with: "$1 $2-$3", options: .regularExpression, range: range)
            } else {
                let pattern = "(\\d)(\\d{3})(\\d{3})(\\d+)"
                number = number.replacingOccurrences(of: pattern, with: "$1 $2-$3-$4", options: .regularExpression, range: range)
            }
            
            let returnString = "+" + number
            
            self.view?.formatPhoneNumber(formattedPhone: returnString)
            
        } catch(let error) {
            print(error)
        }
    }
}
