//
//  GithubRepository.swift
//  TaskMVC
//
//  Created by yasudamasato on 2021/12/19.
//

import Foundation

struct GithubResponse: Codable {
  var items: [GithubRepository]?
}

struct GithubRepository: Codable {
  var fullName: String
  var urlStr: String {
    "https://github.com/\(fullName)"
  }

  enum CodingKeys: String, CodingKey {
    case fullName = "full_name"
  }
}
