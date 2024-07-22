//
//  CarModelMapper.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import Foundation

final class CarModelMapper: BaseModelMapper<ServerCar?, Car> {
    
    override func toLocal(serverEntity: ServerCar?) -> Car {
        Car(brand: serverEntity?.make ?? "",
            model: serverEntity?.model ?? "",
            fuel: serverEntity?.fueltype1 ?? "",
            vclass: serverEntity?.vclass ?? "",
            gearbox: serverEntity?.trany ?? "",
            year: serverEntity?.year ?? "")
    }
}
