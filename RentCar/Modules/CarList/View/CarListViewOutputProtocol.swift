//
//  CarListViewOutputProtocol.swift
//  RentCar
//
//  Created by Pavel Koyushev on 14.07.2024.
//

import Foundation

protocol CarListViewOutputProtocol: AnyObject {
    
    func showCarList(model: [Car])
    func showLoader()
    func hideLoader()
    func showErrorView()
    func hideErrorView()
    func showEmptyView()
}
