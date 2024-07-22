//
//  CarDetailAssembly.swift
//  RentCar
//
//  Created by Pavel Koyushev on 19.07.2024.
//

import UIKit

struct CarDetailAssembly {
    
    static func assemble(model: Car) -> UIViewController {
        
        let router = CarDetailRouter()
        let view = CarDetailViewController()
        let presenter = CarDetailPresenter()
        let interactor = CarDetailInteractor(model: model)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
