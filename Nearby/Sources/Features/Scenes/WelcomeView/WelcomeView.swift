//
//  WelcomeView.swift
//  Nearby
//
//  Created by David Ferreira Lima on 10/12/24.
//

import Foundation
import UIKit

class WelcomeView: UIView {
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Boas vindas ao Nearby"
        label.font = Typography.titleXL
        label.textColor = Colors.gray600
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Tenha cupons de vantagem para usar em seus estabelecimentos favoritos."
        label.font = Typography.titleMD
        label.textColor = Colors.gray500
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subTextForTips: UILabel = {
        let label = UILabel()
        label.text = "Veja como funciona:"
        label.font = Typography.textMD
        label.textColor = Colors.gray500
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tipsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = Typography.action
        button.backgroundColor = Colors.greenBase
        button.setTitleColor(Colors.gray100, for: .normal)
        button.layer.cornerRadius = 8
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
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        setupTips()
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(subTextForTips)
        addSubview(tipsStackView)
        addSubview(startButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            subTextForTips.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            subTextForTips.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            tipsStackView.topAnchor.constraint(equalTo: subTextForTips.bottomAnchor, constant: 24),
            tipsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            tipsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            startButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupTips() {
        guard let firstTipIcon = UIImage(named: "mapIcon")?.withRenderingMode(.alwaysOriginal) else {return}
        guard let secondTipIcon = UIImage(named: "qrcode")?.withRenderingMode(.alwaysOriginal) else {return}
        guard let thirdTipIcon = UIImage(named: "ticket")?.withRenderingMode(.alwaysOriginal) else {return}
        
        let firstTip = TipsView(icon: firstTipIcon, title: "Encontre estabelecimentos", description: "Veja locais perto de você que são parceiros no Nearby")
        
        let secondTip = TipsView(icon: secondTipIcon, title: "Ative o cupom com QR Code", description: "Escaneie o código no estabelecimento para usar o benefício")
        
        let thirdTip = TipsView(icon: thirdTipIcon, title: "Garanta vantagens perto de você", description: "Ative cupom onde estiver, em diferentes tipos de estabelecimento")
        
        tipsStackView.addArrangedSubview(firstTip)
        tipsStackView.addArrangedSubview(secondTip)
        tipsStackView.addArrangedSubview(thirdTip)
    }
}
