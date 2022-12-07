//
//  HomeViewModel.swift
//  Cashome
//
//  Created by Beatriz Leonel da Silva on 07/12/22.
//

import Foundation

class HomeViewModel {
    let date: Date

    init() {
        self.date = Date()
    }

    public func getCurrentDate() -> Date {
        return self.date
    }
}
