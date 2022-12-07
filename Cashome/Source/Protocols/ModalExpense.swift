//
//  Expense.swift
//  Cashome
//
//  Created by Christian Paulo on 05/12/22.
//

import Foundation

struct ModelExpense: Identifiable {
    var id = UUID()
    var responsible : Flavor
}

enum Flavor: String, CaseIterable, Identifiable {
    case beatriz, chris, marcelo, raina
    var id: Self {self}
}
