import UIKit
import MonthYearPicker

class SheetDateView {

    weak var delegate: SheetDateDelegate?
    let alertSheet = UIAlertController(title: nil,
                                       message: nil,
                                       preferredStyle: .actionSheet)
    var picker: MonthYearPickerView

    init(view: UIView) {
        self.picker = MonthYearPickerView(frame: CGRect(origin: CGPoint(x:0, y:1),
                                                        size: CGSize(width: view.bounds.width, height: 216)))
        let height: NSLayoutConstraint = NSLayoutConstraint(item: alertSheet.view as Any,
                                                            attribute: .height,
                                                            relatedBy: .greaterThanOrEqual,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.2,
                                                            constant: 300)
        alertSheet.view.addSubview(self.picker)
        alertSheet.addAction(UIAlertAction(title: "Concluir", style: .cancel, handler: { _ in
            self.delegate?.getSelectedDate()
        }))
        alertSheet.view.addConstraint(height)
    }
}
