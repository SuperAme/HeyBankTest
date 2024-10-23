//
//  MainRouter.swift
//  HeyBankTest
//
//  Created by Americo Meneses on 22/10/24.
//

import UIKit

protocol MainRouterProtocol {
  var entry: MainViewController? { get }
  
  static func startExecution() -> MainRouterProtocol
}

class MainRouter: MainRouterProtocol {
  var entry: MainViewController?
  
  static func startExecution() -> MainRouterProtocol {
    let view: MainViewController = MainViewController()
    
    let interactor = MainInteractor()
    let presenter = MainPresenter()
    let router = MainRouter()
    
    view.presenter = presenter
    
    interactor.presenter = presenter
    
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    
    router.entry = view
    
    return router
  }
}
