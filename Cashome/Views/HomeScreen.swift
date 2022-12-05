//
//  HomeScreen.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 29/11/22.
//

import UIKit
import SwiftUI

class HomeScreen: UIView {

    var actions: Actions?
    let gainCard: CardView = {
        let view = CardView()
        view.configure(color: .positive, icon: .gain, title: .balance)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let expenseCard: CardView = {
        let view = CardView()
        view.configure(color: .negative, icon: .pain, title: .expense)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let cadsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let titleExpense: UILabel = {

        let label = UILabel()
        label.text = "Despesas"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    lazy var addButtonExpense: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        let size = UIImage.SymbolConfiguration(pointSize: 28, weight: .bold, scale: .medium)
        config.baseForegroundColor = UIColor(named: "ActionColor")
        config.image = UIImage(systemName: "plus.circle.fill", withConfiguration: size)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        return button
    }()

    @objc func didTap() {
        actions?.onTapAddButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleExpense)
        self.addSubview(addButtonExpense)
        self.addSubview(cadsStackView)
        self.cadsStackView.addArrangedSubview(gainCard)
        self.cadsStackView.addArrangedSubview(expenseCard)
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
            titleExpense.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -75),
            titleExpense.widthAnchor.constraint(equalToConstant: 150),
            titleExpense.heightAnchor.constraint(equalToConstant: 150),

            addButtonExpense.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17),
            addButtonExpense.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80),
            addButtonExpense.widthAnchor.constraint(equalToConstant: 30),
            addButtonExpense.heightAnchor.constraint(equalToConstant: 30),

            cadsStackView.topAnchor.constraint(equalTo: self.topAnchor ,constant: 200),
            cadsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17),
            cadsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),

//            expenseCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
//            expenseCard.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)

            addButtonExpense.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            addButtonExpense.centerYAnchor.constraint(equalTo: titleExpense.centerYAnchor),
            addButtonExpense.widthAnchor.constraint(equalToConstant: 35),
            addButtonExpense.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}
