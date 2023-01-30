//
//  FieldsMeneger.swift
//  task1.4
//
//  Created by Vladyslav Moroz on 13/12/2022.
//

import Foundation
import UIKit

final class FieldsMeneger {
    
    func maskedText(input: String) -> String {
        var resultString = ""
        
        for symbol in input {
            if resultString.shouldAppendDash {
                resultString.append(symbol)
                resultString.append("-")
            } else if resultString.shouldInsertLetter {
                symbol.isLetter ? resultString.append(symbol) : resultString.append("")
            } else if resultString.shouldInsertNumber {
                symbol.isNumber ? resultString.append(symbol) : resultString.append("")
            }
        }
        return resultString
    }
    
    func progressColor(_ countDown: Float, _ progressBar: UIProgressView){
        if countDown == 0.50 {
            progressBar.progressTintColor = .orange
        } else if countDown == 0.75 {
            progressBar.progressTintColor = .systemOrange
        } else if countDown == 1.0 {
            progressBar.progressTintColor = .green
        } else {
            progressBar.progressTintColor = .red
        }
    }
}
