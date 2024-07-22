//
//  CarDetailInteractorOutputProtocol.swift
//  RentCar
//
//  Created by Pavel Koyushev on 17.07.2024.
//

import Foundation

protocol CarDetailInteractorOutputProtocol: AnyObject {
    
    func fetchedCar(model: Car)
}
