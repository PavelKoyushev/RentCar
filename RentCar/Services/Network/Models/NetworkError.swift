//
//  NetworkError.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import Foundation

enum NetworkError: Error {
    
    case invalidURL
    case network
    case noResponse
    case decoded
}
