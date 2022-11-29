//
//  ViewController.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 25/11/22.
//

import UIKit

class ViewController: UIViewController {

    var screen: ScreenHome?

    override func loadView() {
        self.screen = ScreenHome()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
