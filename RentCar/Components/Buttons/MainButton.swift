//
//  MainButton.swift
//  RentCar
//
//  Created by Pavel Koyushev on 17.07.2024.
//

import UIKit

final class MainButton: UIButton {

    private let cornerRadius: CGFloat = 10.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainButton {
    
    func configure() {
        backgroundColor = .systemCyan
        setTitleColor(.white, for: .normal)
        
        titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        
        layer.cornerRadius = cornerRadius
    }
}
