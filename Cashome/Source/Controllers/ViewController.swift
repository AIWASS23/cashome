//
//  ViewController.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 25/11/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    var screen: HomeScreen?
    override func loadView() {
        self.screen = HomeScreen()
        navigationItem.rightBarButtonItem =
        UIBarButtonItem(image: UIImage(systemName: "person.2.fill"), style: .plain, target: self, action: #selector(showMembers))
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem =
        UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        screen?.expensesTableView.delegate = self
        screen?.expensesTableView.dataSource = self
        screen?.actions = self
    }
    @objc func showMembers() {
        var membersController = MembersViewController()
        self.navigationController?.pushViewController(membersController, animated: true)
    }
}

extension ViewController: Actions {
    func onTapAddButton() {
        let sheetExpense = UIHostingController(rootView: SheetExpense())
        sheetExpense.sheetPresentationController?.prefersGrabberVisible = true
        self.present(sheetExpense, animated: true)
    }
}

// MARK: Protocólo responsável por determinar as células e seus dados
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpensesTableViewCell.identifier, for: indexPath) as? ExpensesTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(numberOfMembers: 3, expenseTitle: "Contasss",
                       value: "100,10", status: .paid, deadLineDate: "05/12")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ViewController: UITableViewDelegate {

}
