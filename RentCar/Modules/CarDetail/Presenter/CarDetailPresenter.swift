//
//  CarDetailPresenter.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import Foundation

final class CarDetailPresenter {
    
    weak var view: CarDetailViewOutputProtocol?
    var router: CarDetailRouterProtocol?
    var interactor: CarDetailInteractorInputProtocol?
    
    deinit {
        print("\(Self.self) deinited")
    }
}

extension CarDetailPresenter: CarDetailInputProtocol {
    
    func viewDidLoad() {
        interactor?.getCar()
    }
}

extension CarDetailPresenter: CarDetailInteractorOutputProtocol {
    
    func fetchedCar(model: Car) {
        view?.showCarDetail(model: model)
    }
}
