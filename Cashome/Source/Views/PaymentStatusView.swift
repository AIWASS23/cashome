//
//  PaymentStatusView.swift
//  Cashome
//
//  Created by Beatriz Leonel da Silva on 29/11/22.
//

import UIKit

class PaymentStatusView: UIView {

    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Pendente"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var statusIcon: UIImageView = {
        let iconConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        let icon = UIImage(systemName: "xmark", withConfiguration: iconConfiguration)
        let image = UIImageView(image: icon)
        image.tintColor = UIColor(named: "NegativeColor")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.backgroundColor = .clear
        stack.layer.cornerRadius = 10
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: "BackgroundDark")?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 1, left: 5, bottom: 1, right: 5)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear

        addSubviewInScreen()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configureCell(status: PaymentStatus) {
        let iconConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        statusIcon.image = UIImage(systemName: status.rawValue, withConfiguration: iconConfiguration)
        if status == .pending {
            self.statusLabel.text = "Pendente"
            statusIcon.tintColor = UIColor(named: "NegativeColor")
        } else {
            self.statusLabel.text = "Pago"
            statusIcon.tintColor = UIColor(named: "PositiveColor")
        }
    }

    private func addSubviewInScreen() {
        self.containerStackView.addArrangedSubview(statusLabel)
        self.containerStackView.addArrangedSubview(statusIcon)
        self.addSubview(containerStackView)
    }

    private func setConstraints() {
        let containerConstraints = [
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        NSLayoutConstraint.activate(containerConstraints)
    }

}
