//
//  Endpoint.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import Foundation

protocol Endpoint {
    
    var baseURL: URL { get }
    var path: String { get }
    var method: RequestMethod { get }
}
