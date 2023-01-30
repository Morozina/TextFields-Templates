//
//  ViewController.swift
//  task1.4
//
//  Created by Vladyslav Moroz on 17/11/2022.
//

import UIKit

final class TextFieldsViewController: UIViewController {
    
    @IBOutlet weak var noNumbersTextField: CustomUITextField!
    @IBOutlet weak var limitedLineTextField: CustomUITextField!
    @IBOutlet weak var withPyphenTextField: CustomUITextField!
    @IBOutlet weak var openLinkTextField: UITextField!
    @IBOutlet weak var passwordTextField: CustomUITextField!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var eightLettersLabel: UILabel!
    @IBOutlet weak var numInPasswordLabel: UILabel!
    @IBOutlet weak var lowerCaseSymbholLabel: UILabel!
    @IBOutlet weak var upperCaseSymbholLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let fieldsMeneger = FieldsMeneger()
    var score = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegates
        noNumbersTextField.delegate = self
        limitedLineTextField.delegate = self
        withPyphenTextField.delegate = self
        openLinkTextField.delegate = self
        passwordTextField.delegate = self
        //-------------------------
        //textfieldTesting
        noNumbersTextField.accessibilityIdentifier = "noNumbersTextField"
        limitedLineTextField.accessibilityIdentifier = "limitedLineTextField"
        withPyphenTextField.accessibilityIdentifier = "withPyphenTextField"
        openLinkTextField.accessibilityIdentifier = "openLinkTextField"
        passwordTextField.accessibilityIdentifier = "passwordTextField"
        scoreLabel.accessibilityIdentifier = "scoreLabel"
        progressBar.accessibilityIdentifier = "progressBar"
        eightLettersLabel.accessibilityIdentifier = "eightLettersLabel"
        numInPasswordLabel.accessibilityIdentifier = "numInPasswordLabel"
        lowerCaseSymbholLabel.accessibilityIdentifier = "lowerCaseSymbholLabel"
        upperCaseSymbholLabel.accessibilityIdentifier = "upperCaseSymbholLabel"
        //-------------------------
        //Corner Radius for textFields
        noNumbersTextField.layer.cornerRadius = 10
        limitedLineTextField.layer.cornerRadius = 10
        withPyphenTextField.layer.cornerRadius = 10
        openLinkTextField.layer.cornerRadius = 10
        passwordTextField.layer.cornerRadius = 10
        //--------------
        scoreLabel.text = " \(score)  "
        progressBar.setProgress(0, animated: true)
    }
    
    @IBAction func passwordTextField(_ sender: UITextField) {
        guard let password = sender.text else { return }
        
        let countDown = passwordLogic(password: password)
        progressBar.setProgress(countDown, animated: true)
        fieldsMeneger.progressColor(countDown, progressBar)
    }
    
    @IBAction func maskedTextFieldAction(_ sender: UITextField) {
        guard let text = sender.text else { return }
        sender.text = fieldsMeneger.maskedText(input: text)
    }
}
