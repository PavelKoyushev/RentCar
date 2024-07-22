//
//  BaseModelMapper.swift
//  RentCar
//
//  Created by Pavel Koyushev on 16.07.2024.
//

import Foundation

class BaseModelMapper<S, L> {
    
    func toLocal(list: [S]?) -> [L] {
        guard let list = list else { return [] }
        return list.compactMap { $0 }
            .map { entity -> L in
            return toLocal(serverEntity: entity)
        }
    }
    
    func toLocalList(list: [S]?) -> [L] {
        guard let list = list else { return [] }
        return list.compactMap { $0 }
            .map { entity -> L in
            return toLocal(dataBase: entity)
        }
    }

    func toLocal(serverEntity: S) -> L {
        preconditionFailure("This method must be overriden")
    }
    
    func toLocal(serverEntity: S?) -> L? {
        preconditionFailure("This method must be overriden")
    }
    
    func toDataBase(local: L) -> S {
        preconditionFailure("This method must be overriden")
    }
    
    func toLocal(dataBase: S) -> L {
        preconditionFailure("This method must be overriden")
    }
}
