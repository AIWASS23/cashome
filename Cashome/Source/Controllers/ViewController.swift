import UIKit
import SwiftUI

class ViewController: UIViewController {

    var screen: HomeScreen?
    var viewModel: HomeViewModel?

    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
        self.viewModel = HomeViewModel()
    }

    lazy var monthTitle: SelectDateView = {
        let view = SelectDateView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configTitle()
        screen?.expensesTableView.delegate = self
        screen?.expensesTableView.dataSource = self
        screen?.actions = self
    }

    func configTitle() {
        monthTitle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        monthTitle.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.navigationItem.titleView = monthTitle
        let gesture = UITapGestureRecognizer(target: self, action: #selector(presentDateAlertSheet))
        monthTitle.isUserInteractionEnabled = true
        monthTitle.addGestureRecognizer(gesture)
    }

    @objc func presentDateAlertSheet(_ sender: UITapGestureRecognizer) {
        let datePickerSheet = SheetDateView(view: self.view)
        self.present(datePickerSheet.alertSheet, animated: true)
    }
}

// MARK: Protocólo responsável por determinar a ação do botão de adicionar despesa
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpensesTableViewCell.identifier, for: indexPath) as? ExpensesTableViewCell
        else {
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
