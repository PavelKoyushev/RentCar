//
//  Car.swift
//  RentCar
//
//  Created by Pavel Koyushev on 14.07.2024.
//

import Foundation

struct Car: CarListCellProtocol, Hashable {
    
    let brand: String
    let model: String
    
    let fuel: String
    let vclass: String
    let gearbox: String
    let year: String
}

extension Car {
    
    var title: String {
        brand + " " + model
    }
    
    var fuelText: String {
        "Fuel:" + " " + fuel
    }
    
    var vclassText: String {
        "Class:" + " " + vclass
    }
    
    var gearboxText: String {
        "Gearbox:" + " " + gearbox
    }
    
    var yearText: String {
        "Year:" + " " + year
    }
}

extension Car {
    
    static var mock: Self {
        Car(brand: "Toyota",
            model: "Camry",
            fuel: "Regular",
            vclass: "Car",
            gearbox: "",
            year: "2001")
    }
}
