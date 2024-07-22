//
//  CarListInteractorInputProtocol.swift
//  RentCar
//
//  Created by Pavel Koyushev on 14.07.2024.
//

import Foundation

protocol CarListInteractorInputProtocol {
    
    func getCars()
    func getListAt(indexPath: IndexPath)
}
