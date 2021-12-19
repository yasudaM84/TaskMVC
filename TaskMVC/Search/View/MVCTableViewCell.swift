//
//  MVCTableViewCell.swift
//  TaskMVC
//
//  Created by sakiyamaK on 2021/03/10.
//

import UIKit

/*
 viewのカプセル化ができていません
 カプセル化させてModelを受け取ってデータを更新させるように改修してください

 */
final class MVCTableViewCell: UITableViewCell {

  static var className: String { String(describing: MVCTableViewCell.self) }

  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var urlLabel: UILabel!

  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    urlLabel.text = nil
  }

  func configure(item: GithubRepository) {
    titleLabel.text = item.fullName
    urlLabel.text = item.urlStr
  }
}

