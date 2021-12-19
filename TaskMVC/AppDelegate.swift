//
//  AppDelegate.swift
//  TaskMVC
//
//  Created by sakiyamaK on 2021/03/10.
//

import UIKit

/*
 ハードコーディングがあります
 強制アンラップがあります
 */

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    Router.shared.showRoot(window: UIWindow(frame: UIScreen.main.bounds))
    return true
  }
}

