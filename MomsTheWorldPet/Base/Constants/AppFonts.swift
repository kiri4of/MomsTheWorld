//
//  AppFonts.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.04.2023.
//

import UIKit

enum WorkSans {
    static func regular(size: CGFloat) -> UIFont {
        UIFont(name: "WorkSans-Regular", size: size.adaptedFontSize)!
    }
    
    static func bold(size: CGFloat) -> UIFont {
        UIFont(name: "WorkSans-Bold", size: size.adaptedFontSize)!
    }
}

enum Inter {
    static func regular(size: CGFloat) -> UIFont {
        UIFont(name: "Inter-Regular", size: size.adaptedFontSize)!
    }
    
    static func bold(size: CGFloat) -> UIFont {
        UIFont(name: "Inter-Bold", size: size.adaptedFontSize)!
    }
    
    static func semiBold(size: CGFloat) -> UIFont {
        UIFont(name: "Inter-SemiBold", size: size.adaptedFontSize)!
    }
}

enum AppFonts {
    static let sans30Bold = WorkSans.bold(size: 28)
    static let sans24Bold = WorkSans.bold(size: 24)
    static let sans24Regular = WorkSans.regular(size: 24)
    
    static let sans13Regular = WorkSans.regular(size: 13)
    
    static let inter24Bold = Inter.bold(size: 24)
    static let inter18Bold = Inter.bold(size: 18)
    static let inter16Bold = Inter.bold(size: 16)
    static let inter14Bold = Inter.bold(size: 14)
    static let inter12Bold = Inter.bold(size: 12)
    
    static let inter20Regular = Inter.regular(size: 20)
    static let inter18Regular = Inter.regular(size: 18)
    static let inter16Regular = Inter.regular(size: 16)
    static let inter14Regular = Inter.regular(size: 14)
    static let inter12Regular = Inter.regular(size: 12)
    static let inter10Regular = Inter.regular(size: 10)
    
    static let inter14SemiBold = Inter.semiBold(size: 14)
    static let inter12SemiBold = Inter.semiBold(size: 12)
    static let inter10SemiBold = Inter.semiBold(size: 10)
}
