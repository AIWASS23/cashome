//
//  GetFirstChar.swift
//  Cashome
//
//  Created by Christian Paulo on 07/12/22.
//

import Foundation

extension String {
    subscript(range: Range<Int>) -> String {
        var newString = ""
        for inter in range {
            let index = self.index(self.startIndex, offsetBy: inter)
            newString += String(self[index])
        }
        return newString

    }
}
