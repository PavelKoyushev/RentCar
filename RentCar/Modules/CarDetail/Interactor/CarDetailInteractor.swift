//
//  CarDetailInteractor.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import Foundation

final class CarDetailInteractor {
    
    weak var presenter: CarDetailInteractorOutputProtocol?
    
    var model: Car
    
    init(presenter: CarDetailInteractorOutputProtocol? = nil, model: Car) {
        self.presenter = presenter
        self.model = model
    }
    
    deinit {
        print("\(Self.self) deinited")
    }
}

extension CarDetailInteractor: CarDetailInteractorInputProtocol {
    
    func getCar() {
        presenter?.fetchedCar(model: model)
    }
}
