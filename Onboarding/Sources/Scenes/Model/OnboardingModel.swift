//
//  OnboardingModel.swift
//  Onboarding
//
//  Created by Виталий Таран on 22.06.2022.
//

import UIKit

 final class OnboardingModel {

     func createModels() -> [Onboarding] {
         return [
         Onboarding(index: 0,
                    title: "Изучай материалы и выполняй задания",
                    description: "Обучение iOS разработке требует много практики, для этого нужно внимательно изучать материалы и выполнять все задания из них. Не забывай повторять примеры, у нас есть домашние задания, их выполнение и обратная связь по ним очень важны.",
                    imageName: "code"
                   )
         ]
     }


}

