//
//  ServerResponseModel.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import Foundation

struct ServerResponseModel<T: Codable>: Codable {
    
    let results: [T]
}
