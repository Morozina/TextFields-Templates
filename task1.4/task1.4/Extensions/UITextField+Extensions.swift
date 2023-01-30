//
//  UITextField+Extensions.swift
//  task1.4
//
//  Created by Vladyslav Moroz on 29/11/2022.
//

import UIKit

class CustomUITextField: UITextField {
   override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
   }
}
