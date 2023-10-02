// 
//  StartScreenModel.swift
//  Mum’s the word
//
//  Created by Kiri4of on 27.04.2023.
//

import UIKit

struct StartScreenModel {
    let title: String
    let desc: String
    let image: UIImage?
    let gradientWord: String
}

let startModel = StartScreenModel(
    title: AppStrings.startScreen,
    desc: AppStrings.onboardingFirstScreenDesc,
    image: AppImages.start,
    gradientWord: AppStrings.startGradientWord
)
