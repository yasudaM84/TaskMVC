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

  func showWeb(from: UIViewController) {
    guard let vc = UIStoryboard.init(name: "Web", bundle: nil).instantiateInitialViewController() else { return }
    show(from: from, next: vc)
  }
}

private extension Router {
  func show(from: UIViewController, next: UIViewController, animated: Bool = true) {
    if let navigationController = from.navigationController {
      navigationController.pushViewController(next, animated: animated)
    } else {
      from.present(next, animated: animated, completion: nil)
    }
  }
}
