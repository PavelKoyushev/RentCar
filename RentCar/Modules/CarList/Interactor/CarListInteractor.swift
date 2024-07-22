//
//  CarListInteractor.swift
//  RentCar
//
//  Created by Pavel Koyushev on 14.07.2024.
//

import Foundation

final class CarListInteractor {
    
    weak var presenter: CarListInteractorOutputProtocol?
    
    private var carList: [Car] = []
    private let apiService: GetCarsProtocol
    
    init(presenter: CarListInteractorOutputProtocol? = nil, apiService: GetCarsProtocol) {
        self.presenter = presenter
        self.apiService = apiService
    }
}

extension CarListInteractor: CarListInteractorInputProtocol {
    
    @MainActor
    func getCars() {
        self.presenter?.hideErrorView()
        self.presenter?.showLoader()
        
        Task {
            do {
                try await Task.sleep(nanoseconds: 500_000_000)
                let cars = try await apiService.getCars()
                self.carList = cars
                
                self.presenter?.fetchedCarList(cars: cars)
                self.presenter?.hideLoader()
            } catch {
                self.presenter?.hideLoader()
                self.presenter?.showErrorView()
            }
        }
    }
    
    func getListAt(indexPath: IndexPath) {
        guard carList.indices.contains(indexPath.row) else {
            return
        }
        presenter?.selectedCar(item: carList[indexPath.row])
    }
}
