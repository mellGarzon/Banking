//
//  ViewController.swift
//  Banking
//
//  Created by Mellani Garzon on 12/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    let creditCard = CreditCard()
    
    var pickerViewExpiry = PickerViewExpiry()

    
    let buttonStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        
        for i in 1...4{
           let button = UIButton()
            let image = UIImage(named: "creditCardFront\(i)")
            button.tag = i
            button.setBackgroundImage(image, for: .normal)
            button.clipsToBounds = true
            button.layer.cornerRadius = 25
            button.addTarget(self, action: #selector(creditCardThemeTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        return stackView
    }()

    
    lazy var fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = UIColor.black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        textField.textContentType = .name
        return textField
    }()
    
    lazy var creditCardNumbersTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Card Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = UIColor.black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        return textField
    }()
    
    lazy var expiryTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Expiry(MM/YY)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = UIColor.black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        textField.addTarget(self, action: #selector(expiryTextFieldDidBegin), for: .editingDidBegin)
        return textField
    }()
    
    lazy var CVVTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "CVV", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = UIColor.black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        return textField
    }()
    
    lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fullNameTextField, creditCardNumbersTextField, expiryTextField, CVVTextField])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        CVVTextField.delegate = self
        creditCardNumbersTextField.delegate = self
        fullNameTextField.delegate = self
        view.addSubview(creditCard)
        view.addSubview(buttonStackView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        configureScrollView()
        addConstraints()
        
        pickerViewExpiry.delegate = self
    }
    

    
    func configureScrollView(){
        scrollView.contentSize = CGSize(width: textFieldStackView.frame.size.width, height: textFieldStackView.frame.size.height)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(textFieldStackView)

    }
    
    @objc func expiryTextFieldDidBegin(){
        let pickerView = UIPickerView()
        pickerView.delegate = pickerViewExpiry
        pickerView.dataSource = pickerViewExpiry
        expiryTextField.inputView = pickerView
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
 
    
    func validateCreditCard(){
        if let type = CreditCardTypeChecker.type(for: creditCardNumbersTextField.text!){
            let isValid = CreditCardTypeChecker.isValid(for: type, value: creditCardNumbersTextField.text!)
            creditCard.verifyFlag(type: type)
        }
    }
    
    func editCreditCardNumbers(numbers: String){
            var result = String()
            
            numbers.enumerated().forEach { (index, character) in
                if index % 4 == 0 && index > 0 {
                    result += "   "
                }
                result.append(character)
            }

            creditCard.numbersLabel.text = result
    }
    

    func addConstraints(){
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: creditCard.bottomAnchor, constant: 40),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        
        let textFieldStackViewConstraints = [
            textFieldStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            textFieldStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            textFieldStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            textFieldStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            textFieldStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            textFieldStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3.0)
        ]
        
        NSLayoutConstraint.activate(textFieldStackViewConstraints)
        
        let creditCardConstraints = [
            creditCard.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            creditCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            creditCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            creditCard.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ]
        
        NSLayoutConstraint.activate(creditCardConstraints)

        
        let buttonStackViewConstraints = [
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            buttonStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
            buttonStackView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 40),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(buttonStackViewConstraints)
    }

}

extension ViewController: PickerViewExpirySelected{
    func expirySelected(month: String, year: String) {
        let expiryYear = year.suffix(2)
        expiryTextField.text = "\(month)/\(expiryYear)"
        creditCard.validDateLabel.text = "\(month)/\(expiryYear)"
    }
}

extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""

        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
        if textField == creditCardNumbersTextField || textField == CVVTextField{
            guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {return false}
        }
        
        switch textField {
        case creditCardNumbersTextField:
            let isCreditCardNumbers = updatedText.count <= 16
            if isCreditCardNumbers{
                editCreditCardNumbers(numbers: updatedText)
            }
            return isCreditCardNumbers
        case fullNameTextField:
            creditCard.fullNameLabel.text = fullNameTextField.text
            return true
        default:
            creditCard.flipToBack()
            
            let isCVV = updatedText.count <= 3
            if isCVV{
                creditCard.CVVLabel.text = updatedText
            }
            return isCVV
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }

}

extension ViewController{
    
    @objc func creditCardThemeTapped(sender: UIButton){
        var shadowColor: CGColor?
        
        switch sender.tag {
        case 1:
            shadowColor = UIColor.systemRed.cgColor
        case 2:
            shadowColor = UIColor.black.cgColor
        case 3:
            shadowColor = UIColor.systemBlue.cgColor
        case 4:
            shadowColor = UIColor.systemPink.cgColor
        default:
            print("Choose a valid credit card")
        }
        
        buttonStackView.arrangedSubviews.forEach({ button in
        UIView.transition(with: creditCard.creditCardFrontimageView,
              duration: 0.70,
              options: .transitionCrossDissolve,
                          animations: { self.creditCard.creditCardFrontimageView.image = UIImage(named: "creditCardFront\(sender.tag)"); self.creditCard.layer.shadowColor = shadowColor},
              completion: nil)
        UIView.transition(with: creditCard.creditCardBackimageView,
              duration: 0.70,
              options: .transitionCrossDissolve,
              animations: { self.creditCard.creditCardBackimageView.image = UIImage(named: "creditCardBack\(sender.tag)") },
              completion: nil)
        })
    }
}
