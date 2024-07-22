//
//  CarDetailRouter.swift
//  RentCar
//
//  Created by Pavel Koyushev on 17.07.2024.
//

import Foundation
import UIKit

final class CarDetailRouter: CarDetailRouterProtocol {
    
    weak var viewController: UIViewController?
    
    deinit {
        print("\(Self.self) deinited")
    }
}
