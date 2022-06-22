//
//  OnboardingView.swift
//  Onboarding
//
//  Created by Виталий Таран on 22.06.2022.
//

import UIKit

class OnboardingView: UIView {
    
    // MARK: - Private propeties
    private var models = [Onboarding]()
    private var selectedIndex = 0 {
        didSet {
            let isListPage = models.count - 1 > selectedIndex
            buttonView.setTitle(isListPage ? Strings.nextButtonTitle : Strings.startButtonTitle, for: .normal)
            buttonView.backgroundColor = isListPage ? .systemBlue : .systemGreen
        }
    }
    
    // MARK: - Views
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = Metric.stackViewSpacing
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var colectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = .zero
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.isPagingEnabled = true
        
        view.dataSource = self
        view.delegate = self
        
        view.showsHorizontalScrollIndicator = false
        
        view.register(OnboardingContentViewCell.self,
                      forCellWithReuseIdentifier: OnboardingContentViewCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pageControl: UIPageControl = {
        let view = UIPageControl()
        view.pageIndicatorTintColor = .systemGray5
        view.currentPageIndicatorTintColor = .systemGray
        return view
    }()
    
    private lazy var buttonView: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.tintColor = .white
        button.layer.cornerRadius = Metric.buttonHeight / 2
        
        button.addTarget(self, action: #selector(buttonTappedAction(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initial
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        addSubview(colectionView)
        addSubview(stackView)
        stackView.addArrangedSubview(pageControl)
        stackView.addArrangedSubview(buttonView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            colectionView.topAnchor.constraint(equalTo: topAnchor),
            colectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            colectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            colectionView.heightAnchor.constraint(equalTo: heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: colectionView.bottomAnchor, constant: Metric.topOffset),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.leftOffset),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metric.rightOffset),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Metric.bottomOffset),
            
            buttonView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight)
        ])
    }
    
    // MARK: - Configuration
    func configureView(with models: [Onboarding]) {
        self.models = models
        pageControl.numberOfPages = models.count
        pageControl.currentPage = 0
        selectedIndex = 0
        colectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource
extension OnboardingView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = colectionView.dequeueReusableCell(withReuseIdentifier: OnboardingContentViewCell.identifier, for: indexPath) as? OnboardingContentViewCell else { return UICollectionViewCell() }
        cell.configureView(with: models[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let newIndexPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.currentPage = newIndexPage
        selectedIndex = newIndexPage
    }
}

// MARL: - Action
extension OnboardingView {
    
    @objc private func buttonTappedAction(_ sender: Any) {
        
        if models.count - 1 > selectedIndex {
            colectionView.scrollToItem(at: IndexPath(item: selectedIndex + 1, section: 0),
                                       at: .centeredHorizontally, animated: true)
            
            selectedIndex += 1
            pageControl.currentPage += 1
        } else {
            // TODO: - Implement start up
        }
    }
}
