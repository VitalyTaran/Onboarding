//
//  OnboardingContentViewCell.swift
//  Onboarding
//
//  Created by Виталий Таран on 22.06.2022.
//
import UIKit

final class OnboardingContentViewCell: UICollectionViewCell {

    static let identifier = "OnboardingContentViewCell"

    // MARK: - Configuration

    func configureView(with model: Onboarding) {
        titleLabel.text = model.title
        imageView.image = UIImage.gifImageWithName(model.imageName)
        descriptionLabel.text = model.description
    }

    // MARK: - Views

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16

        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.textColor = .secondaryLabel
        return label
    }()

    // MARK: - Initial

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }

    private func setupLayout() {
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true

        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35).isActive = true
    }
}
