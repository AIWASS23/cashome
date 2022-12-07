//
//  StringExtension.swift
//  Cashome
//
//  Created by Beatriz Leonel da Silva on 07/12/22.
//

import Foundation

extension String {
    // Função retorna uma String onde apenas a primeira letra vem maiúscula
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
