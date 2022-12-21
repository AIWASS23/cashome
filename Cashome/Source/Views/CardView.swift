//
//  CardExpenseView.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 05/12/22.
//

import UIKit

class CardView: UIView {

    var textExpenseLabel: UILabel?
    var valueExpenseLabel: UILabel?
    var arrowExpenseImageView: UIImageView?
    lazy var expenseStack = self.componentsBalanceAndExpense()

    let stackBalance: UIStackView = {

        let stack = UIStackView()
        stack.axis = .horizontal
//        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "BackgroundDark")
        self.layer.cornerRadius = 6
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(color: ColorsName, icon: IconsName, title: BalanceAndExpense) {
        self.textExpenseLabel = self.textLabelBalanceAndExpense(name: title)
        self.valueExpenseLabel = self.valueLabel(value: 0, color: color)
        self.arrowExpenseImageView = self.arrowLabelBalanceAndExpense(image: icon, color: color)
        addSubviewInStack()
        setConstraints()
    }

    private func addSubviewInStack() {
        self.expenseStack.addArrangedSubview(textExpenseLabel ?? UILabel())
        self.expenseStack.addArrangedSubview(valueExpenseLabel ?? UILabel())

        self.stackBalance.addArrangedSubview(arrowExpenseImageView ?? UIImageView())
        self.stackBalance.addArrangedSubview(expenseStack)

        self.addSubview(stackBalance)

    }

    private func setConstraints() {
            NSLayoutConstraint.activate([

                stackBalance.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                stackBalance.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
                stackBalance.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                stackBalance.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)

        ])
    }
}
