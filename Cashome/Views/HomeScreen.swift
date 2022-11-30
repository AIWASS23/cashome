//
//  HomeScreen.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 29/11/22.
//

import UIKit

class HomeScreen: UIView {

    let titleExpense: UILabel = {
        let label = UILabel()
        label.text = "Despesas"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false

        /* fazer uma extension func para reaproveitamento de Codigo */

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleExpense)
        setupConstraints()

    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        linearGradientColorBackground()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([

            titleExpense.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),
//            titleExpense.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -110),
            titleExpense.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -75),
            titleExpense.widthAnchor.constraint(equalToConstant: 150),
            titleExpense.heightAnchor.constraint(equalToConstant: 150)

        ])
    }
}
