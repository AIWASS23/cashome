import UIKit
import SwiftUI
import MonthYearPicker

class ViewController: UIViewController {
    var screen: HomeScreen?

    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
    }

    lazy var titleMonth: SelectDateView = {
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
        titleMonth.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleMonth.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.navigationItem.titleView = titleMonth
        let gesture = UITapGestureRecognizer(target: self, action: #selector(random))
        titleMonth.isUserInteractionEnabled = true
        titleMonth.addGestureRecognizer(gesture)
    }

    @objc func random2() {
        print("ihuu")
    }

    @objc func random(_ sender: UITapGestureRecognizer) {

        let dateChooserAlert = UIAlertController(title: "Choose date...",
                                                 message: nil,
                                                 preferredStyle: .actionSheet)

        let picker = MonthYearPickerView(frame: CGRect(origin: CGPoint(x: 0,y: 1),
                                                       size: CGSize(width: view.bounds.width, height: 216)))
        picker.addTarget(self, action: #selector(random2), for: .valueChanged)

        dateChooserAlert.view.addSubview(picker)
        dateChooserAlert.addAction(UIAlertAction(title: "Concluir", style: .cancel, handler: { _ in
        }))
        let height: NSLayoutConstraint = NSLayoutConstraint(item: dateChooserAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.1, constant: 300)
        dateChooserAlert.view.addConstraint(height)
        self.present(dateChooserAlert, animated: true)
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
