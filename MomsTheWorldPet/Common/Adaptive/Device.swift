//
//  Device.swift
//  gor_ios
//
//  Created by Kiri4of on 08.09.2022.
//

import CoreGraphics

enum Device {
    case iPhoneSE
    case IPhone8
    case iPhone8Plus
    case IPhone11Pro
    case IPhone11ProMax
    case IphoneXR
    case IPhone13mini
    case IPhone13ProMax
    case IPadimini
    case IPadPro12_9
    case IPadPro9_7
    case IPadPro11
    case IPadAir
    
    static let correntModel: Device = .IPhone11Pro
}

extension Device: RawRepresentable {
    typealias RawValue = CGSize
    
    init?(rawValue: CGSize) {
        switch rawValue {
        case CGSize(width: 320, height: 568):
            self = .iPhoneSE
        case CGSize(width: 375, height: 667):
            self = .IPhone8
        case CGSize(width: 414, height: 736):
            self = .iPhone8Plus
        case CGSize(width: 375, height: 812):
            self = .IPhone11Pro
        case CGSize(width: 414, height: 896):
            self = .IPhone11ProMax
        case CGSize(width: 414, height: 896):
            self = .IphoneXR
        case CGSize(width: 375, height: 812):
            self = .IPhone13mini
        case CGSize(width: 428, height: 926):
            self = .IPhone13ProMax
        case CGSize(width: 768, height: 1024):
            self = .IPadimini
        case CGSize(width: 1024, height: 1366):
            self = .IPadPro12_9
        case CGSize(width: 768, height: 1024):
            self = .IPadPro9_7
        case CGSize(width: 894, height: 1194):
            self = .IPadPro11
        case CGSize(width: 820, height: 1180):
            self = .IPadAir
        default:
            return nil
        }
    }
    
    var rawValue: CGSize {
        switch self {
        case .iPhoneSE:
            return CGSize(width: 320, height: 568)
        case .IPhone8:
            return CGSize(width: 375, height: 667)
        case .iPhone8Plus:
            return CGSize(width: 414, height: 736)
        case .IPhone11Pro:
            return CGSize(width: 375, height: 812)
        case .IPhone11ProMax:
            return CGSize(width: 414, height: 896)
        case .IphoneXR:
            return CGSize(width: 414, height: 896)
        case .IPhone13mini:
            return CGSize(width: 428, height: 926)
        case .IPhone13ProMax:
            return CGSize(width: 428, height: 926)
        case .IPadimini:
            return CGSize(width: 768, height: 1024)
        case .IPadPro12_9:
            return CGSize(width: 1024, height: 1366)
        case .IPadPro9_7:
            return CGSize(width: 768, height: 1024)
        case .IPadPro11:
            return CGSize(width: 894, height: 1194)
        case .IPadAir:
            return CGSize(width: 820, height: 1180)
        }
    }
}
