//
//  CardBalanceView.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 05/12/22.
//

import UIKit

class CardBalanceView: UIView {

    lazy var textBalanceStackView = self.textLabelBalanceAndExpense(name:.balance)
    lazy var valueBalanceStackView = self.valueLabel(value: 0, color: .positive)
    lazy var arrowBalanceImageView = self.arrowLabelBalanceAndExpense(image: .gain, color: .positive)
    lazy var balanceStack = self.componentsBalanceAndExpense()

    let stackBalance: UIStackView = {

        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 2
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "BackgroundDark")
        self.layer.cornerRadius = 6
        addSubviewInStack()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviewInStack() {
        self.stackBalance.addArrangedSubview(arrowBalanceImageView)
        self.stackBalance.addArrangedSubview(textBalanceStackView)
        self.stackBalance.addArrangedSubview(valueBalanceStackView)
        self.stackBalance.addArrangedSubview(balanceStack)
        self.addSubview(stackBalance)

    }

    private func setConstraints() {
            NSLayoutConstraint.activate([

                stackBalance.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                stackBalance.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
                stackBalance.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                stackBalance.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)

        ])
    }
}
