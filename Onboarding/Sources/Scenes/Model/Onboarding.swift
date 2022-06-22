//
//  Onboarding.swift
//  Onboarding
//
//  Created by Виталий Таран on 22.06.2022.
//

import UIKit

struct Onboarding {
    let index: Int
    let title: String
    let description: String
    let imageName: String
}

extension OnboardingView {
    
    enum Metric {
        static let buttonHeight: CGFloat = 44
        static let topOffset: CGFloat = 25
        static let leftOffset: CGFloat = 40
        static let rightOffset: CGFloat = -40
        static let bottomOffset: CGFloat = -50
        
        static let stackViewSpacing: CGFloat = 16
    }

    enum Strings {
        static let nextButtonTitle: String = "Далее"
        static let startButtonTitle: String = "Начать"
    }
}
