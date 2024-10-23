//
//  MainEntity.swift
//  HeyBankTest
//
//  Created by Americo Meneses on 22/10/24.
//

import Foundation

struct CardInfo: Codable {
  let id: Int
  let bankName, cardNumber, cardOwner, expirationDate: String
  let cvv, amount: Int
  
  enum CodingKeys: String, CodingKey {
    case id = "pkTarjetaCreditoID"
    case bankName = "Nombre_Banco"
    case cardNumber = "Numero_Tarjeta"
    case cardOwner = "Titular_Tarjeta"
    case expirationDate = "Fecha_Exp"
    case cvv = "CVV"
    case amount = "Monto"
  }
}

struct CardMovementDetail: Codable {
  let id, description, date, amount: String
  
  enum CodingKeys: String, CodingKey {
    case id = "pkMovimientosID"
    case description = "Descripcion"
    case date = "Fecha"
    case amount = "Monto"
  }
}

typealias CardMovement = [CardMovementDetail]
