//
//  ViewController.swift
//  ios9-demo
//
//  Created by Eiji Kushida on 2017/06/08.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarForLargeTitle()
    }

    /// 大きいフォントのタイトルを設定する
    func setupNavigationBarForLargeTitle() {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)

        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.textColor = UIColor.black
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {

    //左から右へスワイプ
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let editAction = UIContextualAction(style: .normal,
                                            title:  "編集",
                                            handler: { (action: UIContextualAction, view: UIView, success :(Bool) -> Void) in
            print("edit")
            success(true)
        })
        editAction.image = UIImage(named: "edit")
        editAction.backgroundColor = .blue

        let copyAction = UIContextualAction(style: .normal,
                                            title: "コピー",
                                            handler: { (action: UIContextualAction, view: UIView, success :(Bool) -> Void) in
            print("copy")
            success(true)
        })
        copyAction.image = UIImage(named: "copy")

        return UISwipeActionsConfiguration(actions: [editAction, copyAction])
    }

    ///右から左へスワイプ
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let moveAction = UIContextualAction(style: .normal,
                                            title:  "移動",
                                            handler: { (action: UIContextualAction, view: UIView, success :(Bool) -> Void) in
            print("移動")
            success(true)
        })
        moveAction.image = UIImage(named: "move")
        moveAction.backgroundColor = .green

        let removeAction = UIContextualAction(style: .normal,
                                            title: "削除",
                                            handler: { (action: UIContextualAction, view: UIView, success :(Bool) -> Void) in
            print("remove")
            success(true)
        })
        removeAction.image = UIImage(named: "trash")
        removeAction.backgroundColor = .red

        return UISwipeActionsConfiguration(actions: [removeAction, moveAction])
    }
}
