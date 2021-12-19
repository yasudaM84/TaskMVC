//
//  MVCViewController.swift
//  TaskMVC
//
//  Created by  on 2021/3/10.
//

import UIKit

/*
 Modelがありません
 データを取得するソースがコントローラに書かれています
 強制アンラップがあります
 パラメータがカプセル化されていません
 次の画面にモデルを渡していません
 画面遷移の処理が直接ViewControllerに書かれています
 修正してMVCにしてください
*/
final class MVCSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var searchButton: UIButton! {
    didSet {
      searchButton.addTarget(self, action: #selector(tapSearchButton(_sender:)), for: .touchUpInside)
    }
  }

  @IBOutlet weak var indicator: UIActivityIndicatorView!

  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableView.register(UINib.init(nibName: MVCTableViewCell.className, bundle: nil), forCellReuseIdentifier: MVCTableViewCell.className)
      tableView.delegate = self
      tableView.dataSource = self
    }
  }

  var items: [GithubRepository] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.isHidden = true
    indicator.isHidden = true
  }

  @objc func tapSearchButton(_sender: UIResponder) {
    let searchWord = searchTextField.text ?? ""
    indicator.isHidden = false
    tableView.isHidden = true
    GithubAPI.shared.getRepositories(searchWord: searchWord) { items in
      DispatchQueue.main.async {
        self.items = items
        self.indicator.isHidden = true
        self.tableView.isHidden = false
        self.tableView.reloadData()
      }
    }
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let vc = UIStoryboard.init(name: "Web", bundle: nil).instantiateInitialViewController() as! WebViewController
    vc.urlStr = items[indexPath.item].urlStr

    let nav = self.navigationController
    nav?.pushViewController(vc, animated: true)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MVCTableViewCell.className) as? MVCTableViewCell else {
      fatalError()
    }
    let item = items[indexPath.row]
    cell.configure(item: item)
    return cell
  }
}
