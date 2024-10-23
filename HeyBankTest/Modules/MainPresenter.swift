//
//  MainPresenter.swift
//  HeyBankTest
//
//  Created by Americo Meneses on 22/10/24.
//

import UIKit

protocol MainPresenterProtocol {
  var view: MainViewControllerProtocol? { get set }
  var interactor: MainInteractorProtocol? { get set }
  var router: MainRouterProtocol? { get set }
  
  func viewDidLoad()
  func retrieveCardInfo(with cardInfo: CardInfo)
  func retrieveCardMovements(with movements: CardMovement)
}

class MainPresenter: MainPresenterProtocol {
  var view: MainViewControllerProtocol?
  
  var interactor: MainInteractorProtocol?
  
  var router: MainRouterProtocol?
  
  func viewDidLoad() {
    interactor?.getCreditCardMovements()
  }
  
  func retrieveCardInfo(with cardInfo: CardInfo) {
    print("info \(cardInfo)")
  }
  
  func retrieveCardMovements(with movements: CardMovement) {
    print("movements \(movements)")
  }
}
