//
//  ScreenHome.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 29/11/22.
//

import UIKit

class ScreenHome: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        // linearGradientColorBackground()
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        linearGradientColorBackground()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
