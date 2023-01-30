//
//  TextFieldsViewController+TextFieldDelegate.swift
//  task1.4
//
//  Created by Vladyslav Moroz on 17/11/2022.
//

import UIKit
import SafariServices

extension TextFieldsViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case noNumbersTextField:
            return string.withoutDigits
        case limitedLineTextField:
            return limitedCharacters(string, textField, scoreLabel)
        case openLinkTextField:
            return openLink(textField, string)
        default:
            return true
        }
    }
    
    func highlightRangeAfterLimit(_ textField: UITextField) {
        guard let safeText = textField.text else { return }
        let attribString = NSMutableAttributedString(string: safeText)
        attribString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: 10))
        textField.attributedText = attribString
    }
    
    func limitedCharacters(_ string: String, _ textField: UITextField? = nil, _ scoreLabel : UILabel? = nil) -> Bool {
        guard let safeLabel = scoreLabel else { return false }
        guard let safeTextField = textField else { return false }
        score += string.isEmpty ? 1 : -1

        if score < 0 {
            safeLabel.textColor = .red
            safeTextField.layer.borderColor = UIColor.red.cgColor
            safeTextField.layer.borderWidth = 1
            safeTextField.textColor = .red
            highlightRangeAfterLimit(safeTextField)
        } else {
            safeTextField.textColor = .black
            safeLabel.textColor = .black
            safeTextField.layer.borderColor = UIColor.clear.cgColor
        }

        safeLabel.text = " \(score)  "
        return true
    }
    
    func passwordLogic(password: String) -> Float {
        var countDown: Float = 0.0
        
        if NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: password) {
            upperCaseSymbholLabel.textColor = .green
            countDown += 0.25
        } else if !NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: password) {
            upperCaseSymbholLabel.textColor = .black
        }
        
        if NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: password) {
            numInPasswordLabel.textColor = .green
            countDown += 0.25
        } else if !NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: password) {
            numInPasswordLabel.textColor = .black
        }
        
        if NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: password) {
            lowerCaseSymbholLabel.textColor = .green
            countDown += 0.25
        } else if !NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: password) {
            lowerCaseSymbholLabel.textColor = .black
        }
        
        if password.count >= 8 {
            eightLettersLabel.textColor = .green
            countDown += 0.25
        } else if password.count < 8 {
            eightLettersLabel.textColor = .black
        }
        
        return countDown
    }
    
    func openLink(_ textField: UITextField, _ string: String) -> Bool {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(link), object: textField)
        perform(#selector(link), with: textField, afterDelay: 2.0)
        
        if textField.text?.count == 0 {
            textField.text = "https://"
            return true
        } else if textField.text?.count == 8 && string.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    @objc func link(textField: UITextField) {
        guard let safeLink = textField.text else { return }
        if safeLink.isEmpty {
            return
        } else {
            if let url = URL(string: safeLink) {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                
                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            }
        }
    }
}
