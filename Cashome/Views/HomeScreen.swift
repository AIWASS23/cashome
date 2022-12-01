//
//  HomeScreen.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 29/11/22.
//

import UIKit

class HomeScreen: UIView {

    let addButtonExpense: UIButton = {

        let button = UIButton()
        var config = UIButton.Configuration.plain()
        let size = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .medium)
        config.baseForegroundColor = UIColor(named: "ActionColor")
        config.image = UIImage(systemName: "plus.circle.fill", withConfiguration: size)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false

        return button

    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(addButtonExpense)
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

            addButtonExpense.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17),
//            addButtonExpense.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 160),
            addButtonExpense.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80),
            addButtonExpense.widthAnchor.constraint(equalToConstant: 30),
            addButtonExpense.heightAnchor.constraint(equalToConstant: 30)

        ])
    }
}
