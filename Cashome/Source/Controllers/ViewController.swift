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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.actions = self
    }
}

extension ViewController: Actions {
    func onTapAddButton() {
        let sheetExpense = UIHostingController(rootView: SheetExpense())
        sheetExpense.sheetPresentationController?.prefersGrabberVisible = true
        self.present(sheetExpense, animated: true)
    }
}
