//
//  MembersViewController.swift
//  Cashome
//
//  Created by Christian Paulo on 06/12/22.
//

import UIKit
import SwiftUI

class MembersViewController: UIViewController {
    var membersScreen : MembersScreen?
    override func loadView() {
        self.membersScreen = MembersScreen()
        navigationItem.title = "Membros"
        navigationItem.rightBarButtonItem =
        UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(showSheetMembers))
        self.view = self.membersScreen
    }
    @objc func showSheetMembers() {
        let sheetMembers = UIHostingController(rootView: SheetMembers())
        sheetMembers.sheetPresentationController?.prefersGrabberVisible = true
        self.present(sheetMembers, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
       
    }

}
