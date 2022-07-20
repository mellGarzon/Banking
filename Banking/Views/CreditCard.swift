//
//  CreditCard.swift
//  Banking
//
//  Created by Mellani Garzon on 12/07/22.
//

import Foundation
import UIKit

class CreditCard: UIView{
    
    var isTurned = false
    
    let creditCardFrontimageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "creditCardFront1")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let creditCardBackimageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "creditCardBack1")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let creditCardFront: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let creditCardBack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        return view
    }()

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
        label.text = "00/00"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "MELLANI MARIANO GARZON"
        label.font = UIFont(name: "Verdana", size: 14)
        label.textColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let magneticImageView: UIImageView = {
        let image = UIImage(named: "magnetic")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var CVVLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 25
        let tap = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        self.addGestureRecognizer(tap)
        
        self.layer.shadowColor = UIColor.systemRed.cgColor
        self.layer.shadowOffset = CGSize(width: 2,
                                         height: 10)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.5

        
        addSubview(creditCardBack)
        addSubview(creditCardFront)
        
        //CreditCardFront
        creditCardFront.addSubview(creditCardFrontimageView)
        creditCardFront.addSubview(flagImageView)
        creditCardFront.addSubview(fullNameLabel)
        creditCardFront.addSubview(validLabel)
        creditCardFront.addSubview(validDateLabel)
        creditCardFront.addSubview(numbersLabel)
        
        
        //CreditCardBack
        creditCardBack.addSubview(creditCardBackimageView)
        creditCardBack.addSubview(magneticImageView)
        creditCardBack.addSubview(CVVLabel)
        
        addConstraintsCreditCardFront()
        addConstraintsCreditCardBack()
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
    
    @objc func flipCard(){
        if isTurned {
            UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            isTurned = false
            creditCardBack.alpha = 0
            creditCardFront.alpha = 1
        }else{
            UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            isTurned = true
            creditCardBack.alpha = 1
            creditCardFront.alpha = 0
        }
    }
    
    func flipToBack(){
        if isTurned{
            return
        }else{
            UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            isTurned = true
            creditCardBack.alpha = 1
            creditCardFront.alpha = 0
        }
    }
    
    func addConstraintsCreditCardBack(){
        let creditCardBackConstraints = [
            creditCardBack.widthAnchor.constraint(equalTo: widthAnchor),
            creditCardBack.heightAnchor.constraint(equalTo: heightAnchor),
            creditCardBack.leadingAnchor.constraint(equalTo: leadingAnchor),
            creditCardBack.trailingAnchor.constraint(equalTo: trailingAnchor),
            creditCardBack.topAnchor.constraint(equalTo: topAnchor),
            creditCardBack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(creditCardBackConstraints)
        
        let magneticImageViewConstraints = [
            magneticImageView.widthAnchor.constraint(equalTo: widthAnchor),
            magneticImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            magneticImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50)
        ]
        
        NSLayoutConstraint.activate(magneticImageViewConstraints)
        
        let CVVLabelConstraints = [
            CVVLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15),
            CVVLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            CVVLabel.topAnchor.constraint(equalTo: magneticImageView.bottomAnchor, constant: 50),
            CVVLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ]
        
        NSLayoutConstraint.activate(CVVLabelConstraints)
    }
    
    func addConstraintsCreditCardFront() {
        let creditCardFrontConstraints = [
            creditCardFront.widthAnchor.constraint(equalTo: widthAnchor),
            creditCardFront.heightAnchor.constraint(equalTo: heightAnchor),
            creditCardFront.leadingAnchor.constraint(equalTo: leadingAnchor),
            creditCardFront.trailingAnchor.constraint(equalTo: trailingAnchor),
            creditCardFront.topAnchor.constraint(equalTo: topAnchor),
            creditCardFront.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(creditCardFrontConstraints)
        
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
        
        let creditCardFrontimageViewConstraints = [
            creditCardFrontimageView.topAnchor.constraint(equalTo: topAnchor),
            creditCardFrontimageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            creditCardFrontimageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            creditCardFrontimageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(creditCardFrontimageViewConstraints)
        
        let creditCardBackimageViewConstraints = [
            creditCardBackimageView.topAnchor.constraint(equalTo: topAnchor),
            creditCardBackimageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            creditCardBackimageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            creditCardBackimageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(creditCardBackimageViewConstraints)
    }
}



