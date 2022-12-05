//
//  Utilits.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 01/12/22.
//

import UIKit

extension UIView {

    func textLabelBalanceAndExpense(name: BalanceAndExpense) -> UILabel {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = name.rawValue
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white

        return label
    }

    func arrowLabelBalanceAndExpense(image: IconsName, color: ColorsName) -> UIImageView {

        let size = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold)
        let image = UIImage(systemName: image.rawValue, withConfiguration: size)
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(named: color.rawValue)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }

    func valueLabel(value: Float, color: ColorsName) -> UILabel {

        let label = UILabel()
        let roundedValue = round(value * 100) / 100.0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ \(roundedValue)"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(named: color.rawValue)

        return label
    }

    func componentsBalanceAndExpense() -> UIStackView {

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.backgroundColor = .clear
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }
}
