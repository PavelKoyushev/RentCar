//
//  LoaderView.swift
//  RentCar
//
//  Created by Pavel Koyushev on 17.07.2024.
//

import UIKit
import Lottie

final class LoaderView: UIView {
    
    private lazy var backView = UIView()
    private lazy var animationView = LottieAnimationView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoader()
        makeConstraints()
    }
    
    override func layoutSubviews() {
        configureUI()
        loaderPlay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LoaderView {
    
    func setupLoader() {
        
        animationView = .init(name: "loader")
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.5
    }
    
    func makeConstraints() {
        
        addSubview(backView)
        backView.addSubview(animationView)
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        animationView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(180)
        }
    }
    
    func configureUI() {
        
        backView.do {
            $0.backgroundColor = .white
        }
    }
}

private extension LoaderView {
    
    func loaderPlay() {
        animationView.play()
    }
}
