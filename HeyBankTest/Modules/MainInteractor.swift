//
//  MainInteractor.swift
//  HeyBankTest
//
//  Created by Americo Meneses on 22/10/24.
//

import Foundation

protocol MainInteractorProtocol {
  var presenter: MainPresenterProtocol? { get set }
  
  func getCardInfo()
  func getCreditCardMovements()
}

class MainInteractor: MainInteractorProtocol {
  var presenter: MainPresenterProtocol?
  
  func getCardInfo() {
    guard let url = URL(string: "http://xqualo.com.mx/rest/tarjetacredito.php/1") else { return }
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
        guard let data = data, error == nil else { return  }
        
        do {
          let cardInfo = try JSONDecoder().decode(CardInfo.self, from: data)
          self?.presenter?.retrieveCardInfo(with: cardInfo)
        } catch {
            print(error)
        }
    }
    task.resume()
  }
  
  func getCreditCardMovements() {
    guard let url = URL(string: "http://xqualo.com.mx/rest/tarjetacredito-movimientos.php/3") else { return }
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
        guard let data = data, error == nil else { return  }
        
        do {
          let cardMovements = try JSONDecoder().decode(CardMovement.self, from: data)
          self?.presenter?.retrieveCardMovements(with: cardMovements)
        } catch {
            print(error)
        }
    }
    task.resume()
  }
}

