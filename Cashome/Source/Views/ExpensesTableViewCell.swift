//
//  ExpensesTableViewCell.swift
//  Cashome
//
//  Created by Beatriz Leonel da Silva on 01/12/22.
//

import UIKit

class ExpensesTableViewCell: UITableViewCell {

    static var identifier = "cell"
    var numberOfMembers: Int?

    let expenseTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Conta de Luz"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let deadlineDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.tintColor = UIColor.secondaryLabel
        label.text = "21/11"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "R$ 200,00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let paymentStatusView: PaymentStatusView = {
        let view = PaymentStatusView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleContentStack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let rightContentStack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .trailing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: Não esquecer de configurar para mais pessoas do que aguenta
    lazy var profilesStack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.spacing = 3
        stack.alignment = .firstBaseline
        stack.translatesAutoresizingMaskIntoConstraints = false
        let number = self.numberOfMembers ?? 5

        // MARK: Não esquecer de configurar!!!
        for index in 0...number {
            let profileView = ProfileView()
            if index == 0 {
                profileView.configure(firstLetters: "BL", size: .small, type: .responsableProfile)
            } else {
                profileView.configure(firstLetters: "BL", size: .small, type: .defaultProfile)
            }
            stack.addArrangedSubview(profileView)
            profileView.translatesAutoresizingMaskIntoConstraints = false
        }
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(named: "GradientColor")?.withAlphaComponent(0.4)
        addAllSubviews()
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

    public func configure(numberOfMembers: Int, expenseTitle: String, value: String,
                          status: PaymentStatus, deadLineDate: String) {
        expenseTitleLabel.text = expenseTitle
        valueLabel.text = "R$ \(value)"
        paymentStatusView.configureCell(status: status)
        deadlineDateLabel.text = deadLineDate
        self.numberOfMembers = numberOfMembers
    }

    private func addAllSubviews() {
        self.contentView.addSubview(rightContentStack)
        rightContentStack.addArrangedSubview(valueLabel)
        rightContentStack.addArrangedSubview(paymentStatusView)

        self.contentView.addSubview(titleContentStack)
        titleContentStack.addArrangedSubview(expenseTitleLabel)
        titleContentStack.addArrangedSubview(deadlineDateLabel)

        self.contentView.addSubview(profilesStack)
    }

    private func setConstraints() {
        let rightContentStackConstraints = [
            rightContentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            rightContentStack.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            rightContentStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            rightContentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]
        let titleContentStackConstraints = [
            titleContentStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleContentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleContentStack.trailingAnchor.constraint(equalTo: contentView.centerXAnchor)
        ]
        let profilesStackConstraints = [
            profilesStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            profilesStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profilesStack.trailingAnchor.constraint(lessThanOrEqualTo: contentView.safeAreaLayoutGuide.centerXAnchor)
        ]
        NSLayoutConstraint.activate(rightContentStackConstraints)
        NSLayoutConstraint.activate(titleContentStackConstraints)
        NSLayoutConstraint.activate(profilesStackConstraints)
    }

}
