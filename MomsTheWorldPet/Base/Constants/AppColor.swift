//
//  AppColor.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.04.2023.
//

import UIKit

enum AppColor {
    static let purplePrimary: UIColor = #colorLiteral(red: 0.4235294118, green: 0.1921568627, blue: 0.8470588235, alpha: 1)
    static let whitePrimary: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let paleWhite: UIColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
    static let lightGrayPrimary: UIColor = #colorLiteral(red: 0.9431939721, green: 0.9631138444, blue: 0.9907973409, alpha: 1)
    static let descriptionGray: UIColor = #colorLiteral(red: 0.2128768861, green: 0.2128768861, blue: 0.2128768861, alpha: 1)
    static let primaryBlack: UIColor = .black
    static let fieldColor = #colorLiteral(red: 0.510383904, green: 0.5105038285, blue: 0.5142068863, alpha: 1)
    static let primaryGrayTextFiled = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    static let descGray = #colorLiteral(red: 0.787740171, green: 0.787740171, blue: 0.787740171, alpha: 1)
    static let primaryOrange = #colorLiteral(red: 1, green: 0.8, blue: 0.2039215686, alpha: 1)
    static let lightBlue = #colorLiteral(red: 0.7540299296, green: 0.8879592419, blue: 1, alpha: 1)
    static let bgCell = #colorLiteral(red: 0.862745098, green: 0.9058823529, blue: 0.9764705882, alpha: 1)
    static let buttonBlue = #colorLiteral(red: 0.3725490196, green: 0.5058823529, blue: 1, alpha: 1)
    
    enum Gradient {
        static let yellow =  #colorLiteral(red: 1, green: 0.7647058824, blue: 0.1607843137, alpha: 1)
        static let red =  #colorLiteral(red: 1, green: 0.5098039216, blue: 0.9333333333, alpha: 1)
        static let pink = #colorLiteral(red: 1, green: 0.3620835543, blue: 0.7334597707, alpha: 1)
        static let blue = #colorLiteral(red: 0.2345032394, green: 0.3246327043, blue: 0.9795067906, alpha: 1)
        
        static var yellowRed: [UIColor] {
            return [yellow, red]
        }
        
        static var pinkBlue: [UIColor] {
            return [blue, pink]
        }
    }
}
