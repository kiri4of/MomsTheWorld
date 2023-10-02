// 
//  OnboardingModel.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.04.2023.
//

import UIKit

struct OnboardingModel {
    let title: String
    let wordGradient: String
    let desc: String
    let image: UIImage?
    let type: TypeOfGradinet
    var gradientColors: [UIColor] = []
    
    enum TypeOfGradinet {
        case dark
        case light
    }
    
    mutating func getColots() {
        switch self.type {
        case .dark:
            gradientColors = AppColor.Gradient.pinkBlue
        case .light:
            gradientColors = AppColor.Gradient.yellowRed
        }
    }
}

let defaultOnboardingModel: [OnboardingModel] = [
    OnboardingModel(
        title: AppStrings.onboardingFirstScreenTitle,
        wordGradient: AppStrings.gradinetFirst,
        desc: AppStrings.onboardingFirstScreenDesc,
        image: AppImages.onboardingFirstScreen, type: .dark),
        OnboardingModel(
        title: AppStrings.onboardingSecondScreenTitle,
        wordGradient: AppStrings.gradientSecond,
        desc: AppStrings.onboardingFirstScreenDesc,
        image: AppImages.onboardingSecondScreen, type: .light),
    OnboardingModel(
        title: AppStrings.onboardingThirdScreenTitle,
        wordGradient: AppStrings.gradientThird,
        desc: AppStrings.onboardingFirstScreenDesc,
        image: AppImages.onboardingThirdScreen, type: .dark)
]


