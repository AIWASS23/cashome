import UIKit

class DateTimePicker: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {

    var didSelectDates: ((_ start: Date, _ end: Date) -> Void)?

    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()

    private var days = [Date]()
    private var month = [Date]()
    private var year = [Date]()

    let dayFormatter = DateFormatter()
    let monthFormatter = DateFormatter()
    let yearFormatter = DateFormatter()

    var inputView: UIView {
        return pickerView
    }

    func setup() {
        dayFormatter.dateFormat = "d"
        monthFormatter.dateFormat = "MMM"
        yearFormatter.dateFormat = "yyy"

        days = setDays()
        month = setDays()
        year = setDays()
    }

    // MARK: - UIPickerViewDelegate & DateSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return days.count
        case 1:
            return month.count
        case 2:
            return year.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row2: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel

        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }

        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)

        var text = ""

        switch component {
        case 0:
            text = getDayString(from: days[row2])
        case 1:
            text = getMonthString(from: month[row2])
        case 2:
            text = getYearString(from: year[row2])
        default:
            break
        }

        label.text = text

        return label
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row3: Int, inComponent component: Int) {

        let dayIndex = pickerView.selectedRow(inComponent: 0)
        let monthIndex = pickerView.selectedRow(inComponent: 1)
        let yearIndex = pickerView.selectedRow(inComponent: 2)

        guard days.indices.contains(dayIndex),
              month.indices.contains(monthIndex),
              year.indices.contains(yearIndex)
        else { return }
    }

    // MARK: - Private helpers

    private func getDays(of date: Date) -> [Date] {
        var dates = [Date]()

        let calendar = Calendar.current

        // first date
        var currentDate = date

        // adding 30 days to current date
        let oneDayFromNow = calendar.date(byAdding: .day, value: 30, to: currentDate)

        // last date
        let endDate = oneDayFromNow

        while currentDate <= endDate! {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        return dates
    }

    private func setDays() -> [Date] {
        let today = Date()
        return getDays(of: today)
    }

    private func getDayString(from: Date) -> String {
        return dayFormatter.string(from: from)
    }

    private func getMonthString(from: Date) -> String {
        return monthFormatter.string(from: from)
    }

    private func getYearString(from: Date) -> String {
        return yearFormatter.string(from: from)
    }

}
extension Date {

    static func buildTimeRangeStringDays(startDate: Date, endDate: Date) -> String {

        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "d"
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MM"
        
        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "YYY"

        return String(format: "%@ (%@ - %@)",
                      dayFormatter.string(from: startDate),
                      monthFormatter.string(from: startDate),
                      yearFormatter.string(from: startDate))
    }
}
