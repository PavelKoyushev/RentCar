//
//  AppErrorView.swift
//  RentCar
//
//  Created by Pavel Koyushev on 17.07.2024.
//

import UIKit

final class AppErrorView: UIView {
    
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var subTitleLabel = UILabel()
    
    private lazy var button = MainButton()
    
    weak var delegate: AppErrorViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        configureUI()
    }
}

private extension AppErrorView {
    
    func makeConstraints() {
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(button)
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(self.snp_topMargin)
            $0.horizontalEdges.equalToSuperview().inset(32)
            $0.bottom.equalTo(snp.centerY)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(23)
            $0.horizontalEdges.equalToSuperview().inset(32)
            $0.centerX.equalToSuperview()
        }

        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(32)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(32)
            $0.height.equalTo(50)
        }
    }
    
    func configureUI() {
        
        configureImageView()
        configureLabels()
        configureButton()
    }
    
    func configureImageView() {
        
        imageView.do {
            $0.image = UIImage(named: "carPlaceholder")
            $0.contentMode = .scaleToFill
        }
    }
    
    func configureLabels() {
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 18, weight: .medium)
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 0
            $0.text = "Something went wrong"
        }
        
        subTitleLabel.do {
            $0.font = .systemFont(ofSize: 18, weight: .regular)
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 0
            $0.text = "Try again later"
        }
    }
    
    func configureButton() {
        
        button.do {
            $0.setTitle("Retry", for: .normal)
            $0.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        }
    }
}

private extension AppErrorView {
    
    @objc
    func buttonTap() {
        self.delegate?.repeatTapped()
    }
}
