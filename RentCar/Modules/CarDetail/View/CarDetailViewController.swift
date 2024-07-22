//
//  CarDetailViewController.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import UIKit

final class CarDetailViewController: UIViewController {
    
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    
    private lazy var fuelLabel = UILabel()
    private lazy var gearboxLabel = UILabel()
    private lazy var vclassLabel = UILabel()
    private lazy var yearLabel = UILabel()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 13
        return stackView
    }()
    
    var presenter: CarDetailInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeConstraints()
        configureUI()
        
        presenter?.viewDidLoad()
    }
    
    deinit {
        print("\(Self.self) deinited")
    }
}

private extension CarDetailViewController {
    
    func makeConstraints() {
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.topMargin)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(imageView.snp.width).multipliedBy(0.75)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        imageView.do {
            $0.image = UIImage(named: "carsImagesPlaceholder")
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 18, weight: .medium)
        }
        
        stackView.do {
            $0.addArrangedSubview(fuelLabel)
            $0.addArrangedSubview(gearboxLabel)
            $0.addArrangedSubview(vclassLabel)
            $0.addArrangedSubview(yearLabel)
        }
    }
}

extension CarDetailViewController: CarDetailViewOutputProtocol {
    
    func showCarDetail(model: Car) {
        
        title = model.brand
        
        titleLabel.text = model.title
        fuelLabel.text = model.fuelText
        gearboxLabel.text = model.gearboxText
        vclassLabel.text = model.vclassText
        yearLabel.text = model.yearText
    }
}
