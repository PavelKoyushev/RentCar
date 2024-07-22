//
//  CarListAssembly.swift
//  RentCar
//
//  Created by Pavel Koyushev on 14.07.2024.
//

import UIKit

struct CarListAssembly {
    
    static func assemble(apiService: GetCarsProtocol) -> UIViewController {
        
        let router = CarListRouter()
        let view = CarListViewController()
        let presenter = CarListPresenter()
        let interactor = CarListInteractor(apiService: apiService)
        
        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
