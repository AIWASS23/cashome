import UIKit
import MonthYearPicker

class SheetDateView {

    let alertSheet = UIAlertController(title: nil,
                                       message: nil,
                                       preferredStyle: .actionSheet)

    init(view: UIView) {
        let picker = MonthYearPickerView(frame: CGRect(origin: CGPoint(x: 0,y: 1),
                                                       size: CGSize(width: view.bounds.width, height: 216)))
        let height: NSLayoutConstraint = NSLayoutConstraint(item: alertSheet.view as Any,
                                                            attribute: .height,
                                                            relatedBy: .greaterThanOrEqual,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.2,
                                                            constant: 300)
        alertSheet.view.addSubview(picker)
        alertSheet.addAction(UIAlertAction(title: "Concluir", style: .cancel, handler: { _ in
        }))
        alertSheet.view.addConstraint(height)
    }
}
