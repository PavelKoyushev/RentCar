//
//  CarListPresenter.swift
//  RentCar
//
//  Created by Pavel Koyushev on 14.07.2024.
//

import Foundation

final class CarListPresenter {
    
    weak var view: CarListViewOutputProtocol?
    var router: CarListRouterProtocol?
    var interactor: CarListInteractorInputProtocol?
}

extension CarListPresenter: CarListViewInputProtocol {
    
    func viewDidLoad() {
        self.interactor?.getCars()
    }
    
    func selectRowAt(indexPath: IndexPath) {
        self.interactor?.getListAt(indexPath: indexPath)
    }
}

extension CarListPresenter: CarListInteractorOutputProtocol {
    
    func fetchedCarList(cars: [Car]) {
        if cars.isEmpty {
            self.view?.showEmptyView()
        } else {
            self.view?.showCarList(model: cars)
        }
    }
    
    func selectedCar(item: Car) {
        self.router?.openCarDetail(model: item)
    }
    
    func showLoader() {
        self.view?.showLoader()
    }
    
    func hideLoader() {
        self.view?.hideLoader()
    }
    
    func showErrorView() {
        self.view?.showErrorView()
    }
    
    func hideErrorView() {
        self.view?.hideErrorView()
    }
}
