//
//  CarListInteractorOutputProtocol.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import Foundation

protocol CarListInteractorOutputProtocol: AnyObject {
    
    func fetchedCarList(cars: [Car])
    func selectedCar(item: Car)
    
    func showLoader()
    func hideLoader()
    
    func showErrorView()
    func hideErrorView()
}
