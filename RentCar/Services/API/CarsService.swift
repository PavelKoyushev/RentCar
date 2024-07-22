//
//  CarsService.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import Foundation

protocol GetCarsProtocol {
    
    func getCars() async throws ->  [Car]
}

struct CarsService {
    
    let client: NetworkClient
}

extension CarsService: GetCarsProtocol {
    
    func getCars() async throws -> [Car] {
        
        let endpoint = CarsAPI.getCars
        let data = try await client.sendRequest(endpoint: endpoint,
                                                responseModel: ServerResponseModel<ServerCar?>.self)
        let result = CarModelMapper().toLocal(list: data.results)
        return result
    }
}
