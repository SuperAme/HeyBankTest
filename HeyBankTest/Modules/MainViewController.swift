//
//  ViewController.swift
//  HeyBankTest
//
//  Created by Americo Meneses on 22/10/24.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {}

class MainViewController: UIViewController {
  var presenter: MainPresenterProtocol? = MainPresenter()
  
  lazy var mainView: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    return view
  }()
  
  lazy var cardView: UIView = {
    let cardView = UIView()
    cardView.backgroundColor = .systemOrange
    cardView.layer.cornerRadius = 10
    return cardView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
    presenter?.viewDidLoad()
  }

  private func setupLayout() {
    view.addSubview(mainView)
    view.addSubview(cardView)
    
    mainView.translatesAutoresizingMaskIntoConstraints = false
    cardView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      mainView.topAnchor.constraint(equalTo: view.topAnchor),
      mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
      cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
      cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
    ])
  }
}

extension MainViewController: MainViewControllerProtocol {}

