//
//  CreditCard.swift
//  Banking
//
//  Created by Mellani Garzon on 12/07/22.
//

import Foundation
import UIKit

class CreditCard: UIView{

    let numbersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "0000 0000 0000 0000"
        return label
    }()
    
    let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let validLabel: UILabel = {
        let label = UILabel()
        label.text = "VALID THRU"
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        label.textColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let validDateLabel: UILabel = {
        let label = UILabel()
        label.text = "00/0000"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "MELLANI MARIANO GARZON"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 0.40, green: 0.16, blue: 1.00, alpha: 1.00)
        self.layer.cornerRadius = 25
        
        addSubview(flagImageView)

        addSubview(fullNameLabel)
        addSubview(validLabel)
        addSubview(validDateLabel)

        addSubview(numbersLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func verifyFlag(type: CreditCardType){
        if type == .mastercard{
            flagImageView.image = UIImage(named: "mastercard")
        }else if type == .visa{
            flagImageView.image = UIImage(named: "visa")
        }else if type == .americanExpress{
            flagImageView.image = UIImage(named: "american-express")
        }
    }
    
    func addConstraints() {
        let numbersLabelConstraints = [
            numbersLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            numbersLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            numbersLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            numbersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(numbersLabelConstraints)
        
        let fullNameLabelConstraints = [
            fullNameLabel.topAnchor.constraint(equalTo: numbersLabel.bottomAnchor, constant: 20),
            fullNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            fullNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(fullNameLabelConstraints)
        
        let validLabelConstraints = [
            validLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            validLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            validLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),
            validLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(validLabelConstraints)
        
        let validDateLabelConstraints = [
            validDateLabel.topAnchor.constraint(equalTo: validLabel.bottomAnchor),
            validDateLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            validDateLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            validDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(validDateLabelConstraints)
        
        let flagImageViewConstraints = [
            flagImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            flagImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            flagImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            flagImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(flagImageViewConstraints)
    }
}


