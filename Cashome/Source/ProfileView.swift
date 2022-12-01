//
//  ProfileView.swift
//  Cashome
//
//  Created by Beatriz Leonel da Silva on 30/11/22.
//

import UIKit

enum ProfilesTypes {
    case responsableProfile
    case defaultProfile
    case individualProfile
}

enum ProfileSizes: CGFloat {
    case small = 30
    case medium = 50
    case bigger = 60
}

class ProfileView: UIView {

    let firstLettersText: UILabel = {
        let label = UILabel()
        label.text = "Default"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .cyan
        self.addSubview(firstLettersText)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(firstLetters: String, size: ProfileSizes, type: ProfilesTypes) {
        firstLettersText.text = firstLetters
        NSLayoutConstraint.activate([self.widthAnchor.constraint(equalToConstant: size.rawValue),
                                     self.heightAnchor.constraint(equalToConstant: size.rawValue)])
        self.layer.cornerRadius = size.rawValue/2
        self.clipsToBounds = true

        if type == .defaultProfile {
            self.firstLettersText.textColor = UIColor(named: "BackgroundDark")
            self.backgroundColor = .white
            self.layer.borderColor = UIColor(named: "BackgroundDark")?.cgColor
            self.layer.borderWidth = 1
        } else if type == .individualProfile {
            self.firstLettersText.textColor = UIColor(named: "BackgroundDark")
            self.layer.borderWidth = 0
            self.backgroundColor = UIColor(named: "ProfileBlueBackground")
        } else {
            self.firstLettersText.textColor = .white
            self.layer.borderWidth = 0
            self.backgroundColor = UIColor(named: "BackgroundDark")
        }
    }

    private func setConstraints() {
        let firstLetterTextConstraints = [
            firstLettersText.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            firstLettersText.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        NSLayoutConstraint.activate(firstLetterTextConstraints)
    }
}