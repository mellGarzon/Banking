//
//  TransactionViewController.swift
//  Banking
//
//  Created by Mellani Garzon on 18/07/22.
//

import UIKit

class TransactionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        view.backgroundColor = .systemBackground
    }
    
    let transferButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let requestLoanButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [transferButton, requestLoanButton])
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 50
        return view
    }()

}
