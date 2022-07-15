//
//  ViewController.swift
//  Banking
//
//  Created by Mellani Garzon on 12/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    let creditCard = CreditCard()
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = UIColor.black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        textField.textContentType = .name
        textField.addTarget(self, action: #selector(fullNameTextFieldChanged), for: .editingChanged)
        return textField
    }()
    
    let creditCardNumbersTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Card Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = UIColor.black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        textField.addTarget(self, action: #selector(cardNumberTextFieldChanged), for: .editingChanged)
        return textField
    }()
    
    let expiryTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Expiry(MM/YY)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = UIColor.black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        textField.addTarget(self, action: #selector(expiryTextFieldChanged), for: .editingChanged)
        return textField
    }()
    
    let CVVTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "CVV", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = UIColor.black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        textField.addTarget(self, action: #selector(CVVTextFieldChanged), for: .editingChanged)
        return textField
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [expiryTextField, CVVTextField])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.backgroundColor = .systemBackground
        view.addSubview(creditCard)
        view.addSubview(fullNameTextField)
        view.addSubview(creditCardNumbersTextField)
        view.addSubview(stackView)
        addConstraints()
    }
    
    @objc func fullNameTextFieldChanged(){
        creditCard.fullNameLabel.text = fullNameTextField.text
    }
    
    @objc func expiryTextFieldChanged(){

    }
    
    @objc func CVVTextFieldChanged(){
        //CVVTextField.text
    }
    
    @objc func cardNumberTextFieldChanged(){
        //nao deixar passar de 16
        //nao deixar entrar letras
        
        
        if let numbers = creditCardNumbersTextField.text{
            if let type = CreditCardTypeChecker.type(for: numbers){
                let isValid = CreditCardTypeChecker.isValid(for: type, value: numbers)
                creditCard.verifyFlag(type: type)
            }
            
            var result = String()
            numbers.enumerated().forEach { (index, character) in
                
                // Add space every 4 characters
                
                if index % 4 == 0 && index > 0 {
                    result += "   "
                }
                result.append(character)

            }

            creditCard.numbersLabel.text = result

        }
    }

    func addConstraints(){
        let creditCardConstraints = [
            creditCard.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            creditCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            creditCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            creditCard.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ]
        
        NSLayoutConstraint.activate(creditCardConstraints)
        
        let fullNameConstraints = [
            fullNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 70),
            fullNameTextField.topAnchor.constraint(equalTo: creditCard.bottomAnchor, constant: 20),
            fullNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(fullNameConstraints)
        
        let creditCardNumbersTextFieldConstraints = [
            creditCardNumbersTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            creditCardNumbersTextField.heightAnchor.constraint(equalToConstant: 70),
            creditCardNumbersTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            creditCardNumbersTextField.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(creditCardNumbersTextFieldConstraints)
        
        
        let stackViewConstraints = [
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            stackView.heightAnchor.constraint(equalToConstant: 70),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: creditCardNumbersTextField.bottomAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(stackViewConstraints)
        
        let imageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(imageViewConstraints)

    }

}
