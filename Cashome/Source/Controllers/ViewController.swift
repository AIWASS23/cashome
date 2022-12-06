import UIKit
import SwiftUI
import MonthYearPicker

class ViewController: UIViewController {
    var text: UILabel = {
        let textView = UILabel()
        textView.text = "teste"
        textView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textView.textColor = UIColor.black
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.text = "escrevendo"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    private lazy var dateTimePicker: DateTimePicker = {
        let picker = DateTimePicker()
        picker.setup()
        picker.didSelectDates = {[weak self](startDate, endDate) in
            let texto = Date.buildTimeRangeStringDays(startDate: startDate, endDate: endDate)
            self?.text.text = texto
        }
        return picker
    }()

    var screen: HomeScreen?

    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
    }

    lazy var titleMonth: SelectDateView = {
        let view = SelectDateView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(random))
//        view.isUserInteractionEnabled = true
//        view.addGestureRecognizer(gesture)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.expensesTableView.delegate = self
        screen?.expensesTableView.dataSource = self
        screen?.actions = self
        textField.inputView = datePicker
        configTitle()
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
        print("ihuu")

        let dateChooserAlert = UIAlertController(title: "Choose date...",
                                                 message: nil,
                                                 preferredStyle: .actionSheet)
        let picker = MonthYearPickerView(frame: CGRect(origin: CGPoint(x: 0,
                                                                       y: (view.bounds.height - 216) / 2),
                                                                       size: CGSize(width: view.bounds.width,
                                                                       height: 216)))
        picker.minimumDate = Date()
        picker.maximumDate = Calendar.current.date(byAdding: .year, value: 10, to: Date())
        picker.addTarget(self, action: #selector(random2), for: .valueChanged)

        dateChooserAlert.view.addSubview(picker)
        dateChooserAlert.addAction(UIAlertAction(title: "Concluir", style: .cancel, handler: { action in
            
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
