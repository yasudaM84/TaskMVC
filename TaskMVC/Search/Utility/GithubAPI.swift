//
//  GithubAPI.swift
//  TaskMVC
//
//  Created by yasudamasato on 2021/12/19.
//

import Foundation

final class GithubAPI {

  static let shared = GithubAPI()
  private init() {}

  func getRepositories(searchWord: String, completion: (([GithubRepository]) -> Void)? = nil) {
    let url: URL = URL(string: "https://api.github.com/search/repositories?q=\(searchWord)&sort=stars")!
    let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
      guard let data = data,
            let response = try? JSONDecoder().decode(GithubResponse.self, from: data),
            let models = response.items else {
              completion?([])
              return
            }
      completion?(models)
    })
    task.resume()
  }
}
