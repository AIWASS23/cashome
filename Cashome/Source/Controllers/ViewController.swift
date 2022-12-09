import UIKit
import SwiftUI
import MonthYearPicker

class ViewController: UIViewController {

    var screen: HomeScreen?
    var viewModel: HomeViewModel?
    var datePickerSheet: SheetDateView?

    override func loadView() {
        self.viewModel = HomeViewModel()
        self.screen = HomeScreen()
        navigationItem.rightBarButtonItem =
        UIBarButtonItem(image: UIImage(systemName: "person.2.fill"), style: .plain, target: self, action: #selector(showMembers))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "ActionColor")
        self.view = self.screen
    }

    lazy var monthTitle: TitleDateView = {
        let view = TitleDateView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        monthTitle.delegate = self
        configTitle()
        navigationItem.backBarButtonItem =
        UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        screen?.expensesTableView.delegate = self
        screen?.expensesTableView.dataSource = self
        screen?.actions = self
    }

    func configTitle() {
        monthTitle.update()
        monthTitle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        monthTitle.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.navigationItem.titleView = monthTitle
        let gesture = UITapGestureRecognizer(target: self, action: #selector(presentDateAlertSheet))
        monthTitle.isUserInteractionEnabled = true
        monthTitle.addGestureRecognizer(gesture)
    }

    @objc func presentDateAlertSheet(_ sender: UITapGestureRecognizer) {
        self.datePickerSheet = SheetDateView(view: self.view)
        self.datePickerSheet!.delegate = self
        self.present(self.datePickerSheet!.alertSheet, animated: true)
    }

    @objc func showMembers() {
        var membersController = MembersViewController()
        self.navigationController?.pushViewController(membersController, animated: true)
    }
}

// MARK: Protocólo responsável por capturar a data selecionada na sheet
extension ViewController: SheetDateDelegate {
    func getSelectedDate() {
        if let date = datePickerSheet?.picker.date {
            viewModel?.date = date
            monthTitle.update()
        }
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

// MARK: Protocólo responsável por atualizar dados do Title Date
extension ViewController: TitleDateDelegate {
    func updateTitle() -> String {
        let date = viewModel?.getCurrentDate()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMMM yyyy"
        return dateFormat.string(from: date!).capitalizeFirstLetter()
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
        if indexPath.row == 0 {
            cell.layer.cornerRadius = 8
            cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.layer.cornerRadius = 8
            cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
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
