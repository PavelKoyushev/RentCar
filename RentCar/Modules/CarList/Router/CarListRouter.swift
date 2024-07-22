//
//  CarListRouter.swift
//  RentCar
//
//  Created by Pavel Koyushev on 14.07.2024.
//

import Foundation
import UIKit

final class CarListRouter {
    
    weak var viewController: UIViewController?
    
}

extension CarListRouter: CarListRouterProtocol {
   
    func openCarDetail(model: Car) {
        
        let view = CarDetailAssembly.assemble(model: model)
        viewController?.navigationController?.pushViewController(view, animated: true)
    }
}
