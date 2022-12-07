//
//  TitleDateDelegate.swift
//  Cashome
//
//  Created by Beatriz Leonel da Silva on 07/12/22.
//

import Foundation

protocol TitleDateDelegate: AnyObject {
    func updateTitle() -> String
}

protocol SheetDateDelegate: AnyObject {
    func getSelectedDate()
}
