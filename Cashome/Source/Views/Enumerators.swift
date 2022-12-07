//
//  Enumerators.swift
//  Cashome
//
//  Created by Marcelo De Araújo on 05/12/22.
//

import Foundation

enum IconsName: String {
    case gain = "arrow.up.circle.fill"
    case pain = "arrow.down.circle.fill"
}

enum ColorsName: String {
    case positive = "PositiveColor"
    case negative = "NegativeColor"
}

enum BalanceAndExpense: String {
    case balance = "Valor Mensal"
    case expense = "Gastos Totais"
}

enum PaymentStatus: String {
    case paid = "checkmark"
    case pending = "xmark"
}

enum ProfilesTypes {
    case responsableProfile
    case defaultProfile
    case individualProfile
}

enum ProfileSizes: CGFloat {
    case small = 25
    case medium = 50
    case bigger = 60
}

