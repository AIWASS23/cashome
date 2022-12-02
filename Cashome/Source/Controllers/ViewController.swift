//
//  ViewController.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 25/11/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    var screen: HomeScreen?

    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
        screen?.onTapAddButton = {
            let sheet = UIHostingController(rootView: Sheet())
            self.present(sheet, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
}
}
