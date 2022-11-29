//
//  GradientColor.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 29/11/22.
//

import UIKit

extension UIView {

    func linearGradientColorBackground() {
        let linearGradientColorLayer = CAGradientLayer()

        linearGradientColorLayer.colors = [
//            UIColor.init(red: (201-20)/255, green: (214-20)/255, blue: (234-20)/255, alpha: 1).cgColor,
            UIColor(named: "GradientColor")?.cgColor as Any,
            UIColor.white.cgColor
        ]

        linearGradientColorLayer.startPoint = CGPoint(x: 0, y: 0.0)
        linearGradientColorLayer.endPoint = CGPoint(x: 0, y: 0.5)
        linearGradientColorLayer.locations = [0.25,1]
        linearGradientColorLayer.frame = self.bounds
        self.layer.insertSublayer(linearGradientColorLayer, at: 0)
      }
}
