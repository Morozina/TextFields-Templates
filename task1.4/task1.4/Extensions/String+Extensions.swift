//
//  String+Extensions.swift
//  task1.4
//
//  Created by Vladyslav Moroz on 29/11/2022.
//

import Foundation

extension String {
    var withoutDigits: Bool {
        let digits = CharacterSet.decimalDigits
        let compSepByNumInSet = self.rangeOfCharacter(from: digits.inverted)
        return self.isEmpty ? true : compSepByNumInSet != nil
    }
    
    var shouldInsertNumber: Bool {
        self.count < 11 && self.contains("-")
    }
    
    var shouldInsertLetter: Bool {
        !self.contains("-")
    }
    
    var shouldAppendDash: Bool {
        self.count == 4
    }
}
