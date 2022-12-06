import UIKit

class AlertSheetDateView: UIView {
    let datePicker = UIDatePicker()
    lazy var fieldText: UITextField = {
        let insertDate = UITextField()
//        insertDate.text = "Insira a data"
        insertDate.backgroundColor = .blue
        insertDate.translatesAutoresizingMaskIntoConstraints = false
        return insertDate
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.addSubview(fieldText)
        setConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setConstraints() {
        let monthSelectedText = [
            fieldText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fieldText.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            fieldText.widthAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(monthSelectedText)
    }
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        toolbar.setItems([doneBtn], animated: true)
        fieldText.inputAccessoryView = toolbar
        fieldText.inputView = datePicker
        // fieldText.datePickerMode = .date
    }
//    func donePressend() {
//        fieldText.text = "\(datePicker.date)"
//        self.view.endEditing(true)
//    }
}
