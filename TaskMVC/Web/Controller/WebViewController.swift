//
//  WebViewController.swift
//  TaskMVC
//
//  Created by  on 2021/3/10.
//

import UIKit
import WebKit

/*
 カプセル化されてません
 前の画面からModelを受け取っていません
 強制アンラップがあります
 */
final class WebViewController: UIViewController {

  @IBOutlet private weak var webView: WKWebView!

  private var githubRepository: GithubRepository?

  func configure(githubRepository: GithubRepository) {
    self.githubRepository = githubRepository
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    guard
      let githubRepository = githubRepository,
      let url = URL(string: githubRepository.urlStr) else {
      return
    }
    webView.load(URLRequest(url: url))
  }
}
