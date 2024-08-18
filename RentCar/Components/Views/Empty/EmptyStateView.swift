//
//  EmptyStateView.swift
//  RentCar
//
//  Created by Pavel Koyushev on 18.08.2024.
//

import UIKit

final class EmptyStateView: UIView {
    
    private lazy var backView = UIView()
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var subTitleLabel = UILabel()
    
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

private extension EmptyStateView {
    
    func makeConstraints() {
        
        addSubview(backView)
        
        backView.addSubview(imageView)
        backView.addSubview(titleLabel)
        backView.addSubview(subTitleLabel)
        
        backView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(32)
            $0.centerY.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top)
            $0.horizontalEdges.equalTo(backView)
            $0.height.equalTo((UIScreen.main.bounds.width - 64) * 0.75)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(23)
            $0.horizontalEdges.equalTo(backView)
        }

        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalTo(backView)
            $0.bottom.equalTo(backView)
        }
    }
    
    func configureUI() {
        
        configureImageView()
        configureLabels()
    }
    
    func configureImageView() {
        
        imageView.do {
            $0.image = UIImage(named: "carPlaceholder")
        }
    }
    
    func configureLabels() {
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 18, weight: .medium)
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 0
            $0.text = "There are currently no cars for rent"
        }
        
        subTitleLabel.do {
            $0.font = .systemFont(ofSize: 18, weight: .regular)
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 0
            $0.text = "Please try again later"
        }
    }
}
