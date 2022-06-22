//
//  ViewController.swift
//  Onboarding
//
//  Created by Виталий Таран on 22.06.2022.
//

import UIKit

class OnboardingController: UIViewController {
    
    var model: OnboardingModel?
    
    // Это вычисляемое свойство преобразует тип родительской view в OnboardingView
    // Это делается чтобы мы в будущем могли из Controller'a обращаться к элементам View
    private var onboardingView: OnboardingView? {
        guard isViewLoaded else { return nil }
        return view as? OnboardingView
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Присваиваем значение View наш созданный класс OnboardingView()
        view = OnboardingView()
        
        model = OnboardingModel()
        configureView()
    }
}

// MARK: - Configurations
private extension OnboardingController {
    func configureView() {
        guard let models = model?.createModels() else { return }
        models.forEach { [unowned self] model in
            onboardingView?.configureView(with: [model])
        }
        onboardingView?.configureView(with: models)
    }
}

