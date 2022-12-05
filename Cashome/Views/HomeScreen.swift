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

    let titleExpense: UILabel = {
        let label = UILabel()
        label.text = "Despesas"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false

        /* fazer uma extension func para reaproveitamento de Codigo */

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
            titleExpense.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleExpense.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -75),
            titleExpense.heightAnchor.constraint(equalToConstant: 35),

            addButtonExpense.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            addButtonExpense.centerYAnchor.constraint(equalTo: titleExpense.centerYAnchor),
            addButtonExpense.widthAnchor.constraint(equalToConstant: 35),
            addButtonExpense.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}
