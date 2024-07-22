//
//  CarsAPI.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import Foundation

enum CarsAPI {
    
    case getCars
}

extension CarsAPI: Endpoint {
    
    var baseURL: URL {
        Consts.API.cars
    }
    
    var path: String {
        "/api/explore/v2.1/catalog/datasets/all-vehicles-model/records"
    }
    
    var method: RequestMethod {
        .get
    }
}
