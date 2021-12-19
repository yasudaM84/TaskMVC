//
//  Router.swift
//  TaskMVC
//
//  Created by yasudamasato on 2021/12/19.
//

import UIKit

final class Router {

  static let shared: Router = .init()
  private init() {}

  private var window: UIWindow?

  func showRoot(window: UIWindow?) {
    guard let vc = UIStoryboard.init(name: "MVCSearch", bundle: nil).instantiateInitialViewController() else { return }
    let nav = UINavigationController(rootViewController: vc)
    window?.rootViewController = nav
    window?.makeKeyAndVisible()
    self.window = window
  }
}
