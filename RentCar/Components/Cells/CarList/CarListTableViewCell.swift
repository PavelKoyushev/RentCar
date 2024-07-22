//
//  CarListTableViewCell.swift
//  RentCar
//
//  Created by Pavel Koyushev on 14.07.2024.
//

import UIKit
import SnapKit
import Then

final class CarListTableViewCell: UITableViewCell, CodeCellConfigurable {
    
    private lazy var carImageView = UIImageView()
    private lazy var carTitleLabel = UILabel()
    private lazy var carModelLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        configureUI()
    }
    
    func configureCell(with model: CarListCellProtocol) {
        
        carTitleLabel.text = model.brand
        carModelLabel.text = model.model
        carImageView.image = UIImage(named: "carPlaceholder")
    }
}

private extension CarListTableViewCell {
    
    func makeConstraints() {
        
        addSubview(carImageView)
        addSubview(carTitleLabel)
        addSubview(carModelLabel)
        
        carImageView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.width.equalTo(100)
            $0.height.equalTo(80)
        }
        
        carTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalTo(carImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(16)
        }
        
        carModelLabel.snp.makeConstraints {
            $0.top.equalTo(carTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(carImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(16)
        }
    }
    
    func configureUI() {
        
        carImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        carTitleLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .bold)
        }
        
        carModelLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .bold)
        }
    }
}
