//
//  MembersScreen.swift
//  Cashome
//
//  Created by Christian Paulo on 06/12/22.
//

import UIKit

class MembersScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        backgroundColor = UIColor(named: "BackgroundPattern")
    }
}
