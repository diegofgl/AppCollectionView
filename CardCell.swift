//
//  CustomCollectionViewCell.swift
//  AppCollectionView
//
//  Created by Diego Rodrigues on 04/08/23.
//

import UIKit

class CardCell: UICollectionViewCell, UITextFieldDelegate {
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = CGColor(red: 215/255, green: 213/255, blue: 172/255, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.init(red: 44/255, green: 33/255, blue: 70/255, alpha: 1).cgColor
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private let animationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        //imageView.image = UIImage(named: "box.truck")
        imageView.image = UIImage(systemName: "box.truck")
        imageView.tintColor = .black
        return imageView
    }()
    
    private let orderStatusDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "arrow.right")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(stackView)
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        verticalStackView.addArrangedSubview(orderStatusDescriptionLabel)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 8
        horizontalStackView.addArrangedSubview(animationImageView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(actionButton)
        
        stackView.addArrangedSubview(horizontalStackView)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
    
    func configure() {
        orderStatusDescriptionLabel.text = "Em trânsito"
        titleLabel.text = "Pedido 12345"
        descriptionLabel.text = "Seu pedido está indo até você."
        
        actionButton.addTarget(self, action: #selector(animateButton), for: .touchUpInside)
        
        startAnimation()

        
    }
    
    @objc private func animateButton() {
        UIView.animate(withDuration: 0.3, animations: {
            self.actionButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.actionButton.transform = CGAffineTransform.identity
            }
        }
    }
    
    private func startAnimation() {
        UIView.animate(withDuration: 1.0, animations: {
            self.animationImageView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4) // Aumenta a imagem em 20%
        }) { _ in
            UIView.animate(withDuration: 1.0) {
                self.animationImageView.transform = CGAffineTransform.identity
            } completion: { _ in
                self.startAnimation()
            }
        }
    }
}
