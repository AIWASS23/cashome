//
//  ExpensesTableViewCell.swift
//  Cashome
//
//  Created by Beatriz Leonel da Silva on 01/12/22.
//

import UIKit

class ExpensesTableViewCell: UITableViewCell {

    static var identifier = "cell"

    let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.text = "R$ 200,00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let paymentStatusView: PaymentStatusView = {
        let view = PaymentStatusView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let rightContentStack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(named: "GradientColor")?.withAlphaComponent(0.4)
        self.contentView.addSubview(rightContentStack)
        rightContentStack.addArrangedSubview(valueLabel)
        rightContentStack.addArrangedSubview(paymentStatusView)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // Função que adiciona efeito nos estados isSelect
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setConstraints() {
        let rightContentStackConstraints = [
            rightContentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            rightContentStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            rightContentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(rightContentStackConstraints)
    }

}
