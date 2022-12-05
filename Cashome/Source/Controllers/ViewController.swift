//
//  ViewController.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 25/11/22.
//

import UIKit

class ViewController: UIViewController {

    var screen: HomeScreen?

    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.expensesTableView.delegate = self
        screen?.expensesTableView.dataSource = self
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
