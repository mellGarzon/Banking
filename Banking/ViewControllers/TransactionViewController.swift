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
        
        setupTableView()
        
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 1.00, alpha: 1.00)
        
        view.addSubview(transactionsTitle)
        view.addSubview(stackView)
        
        transferView.addSubview(transferLabel)
        transferView.addSubview(transferTextField)
        transferView.addSubview(transferAmountLabel)
        transferView.addSubview(transferAmountTextField)
        transferView.addSubview(transferButton)
        transferView.addSubview(transferTitleLabel)
        
        requestLoanView.addSubview(requestLoanTextField)
        requestLoanView.addSubview(requestLoanLabel)
        requestLoanView.addSubview(requestLoanButton)
        requestLoanView.addSubview(requestLoanTitleLabel)
        
        addConstraints()
    }
    
    let tableView = UITableView()
    
    let transferView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let requestLoanView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let transferTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Transfer money"
        return label
    }()
    
    let requestLoanTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Request loan"
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [transferView, requestLoanView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    let transferLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Transfer to"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let transferAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Amount"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let transferTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = 15
        textfield.layer.shadowColor = UIColor.lightGray.cgColor
        textfield.layer.shadowOffset = .zero
        textfield.layer.shadowRadius = 10
        textfield.layer.shadowOpacity = 0.5
        return textfield
    }()
    
    let transferAmountTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = 15
        textfield.layer.shadowColor = UIColor.lightGray.cgColor
        textfield.layer.shadowOffset = .zero
        textfield.layer.shadowRadius = 10
        textfield.layer.shadowOpacity = 0.5
        return textfield
    }()
    
    let transferButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrow.right"), for: .normal)
        return button
    }()
    
    let requestLoanTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = 15
        textfield.layer.shadowColor = UIColor.lightGray.cgColor
        textfield.layer.shadowOffset = .zero
        textfield.layer.shadowRadius = 10
        textfield.layer.shadowOpacity = 0.5
        return textfield
    }()
    
    let requestLoanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Amount"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let requestLoanButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrow.right"), for: .normal)
        return button
    }()
    
    let transactionsTitle: UILabel = {
        let label = UILabel()
        label.text = "Recent Transactions"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupTableView(){
       
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        view.addSubview(tableView)
    }
    
    func addConstraints(){
        
        let stackViewConstraints = [
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(stackViewConstraints)
        
        let transferTitleLabelConstraints = [
            transferTitleLabel.widthAnchor.constraint(equalTo: transferView.widthAnchor, multiplier: 1),
            transferTitleLabel.heightAnchor.constraint(equalTo: transferView.heightAnchor, multiplier: 0.25),
            transferTitleLabel.topAnchor.constraint(equalTo: transferView.topAnchor)
        ]
        
        NSLayoutConstraint.activate(transferTitleLabelConstraints)
        
        let transferTextFieldConstraints = [
            transferTextField.widthAnchor.constraint(equalTo: transferView.widthAnchor, multiplier: 0.4),
            transferTextField.heightAnchor.constraint(equalTo: transferView.heightAnchor, multiplier: 0.4),
            transferTextField.leadingAnchor.constraint(equalTo: transferView.leadingAnchor),
            transferTextField.topAnchor.constraint(equalTo: transferTitleLabel.bottomAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(transferTextFieldConstraints)
        
        let transferLabelConstraints = [
            transferLabel.widthAnchor.constraint(equalTo: transferView.widthAnchor, multiplier: 0.4),
            transferLabel.heightAnchor.constraint(equalTo: transferView.heightAnchor, multiplier: 0.4),
            transferLabel.topAnchor.constraint(equalTo: transferTextField.bottomAnchor),
            transferLabel.leadingAnchor.constraint(equalTo: transferView.leadingAnchor),
        ]
        
        NSLayoutConstraint.activate(transferLabelConstraints)
        
        let transferAmountTextFieldConstraints = [
            transferAmountTextField.widthAnchor.constraint(equalTo: transferView.widthAnchor, multiplier: 0.4),
            transferAmountTextField.heightAnchor.constraint(equalTo: transferView.heightAnchor, multiplier: 0.4),
            transferAmountTextField.leadingAnchor.constraint(equalTo: transferTextField.trailingAnchor, constant: 10),
            transferAmountTextField.topAnchor.constraint(equalTo: transferTitleLabel.bottomAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(transferAmountTextFieldConstraints)
        
        let transferAmountLabelConstraints = [
            transferAmountLabel.widthAnchor.constraint(equalTo: transferView.widthAnchor, multiplier: 0.4),
            transferAmountLabel.heightAnchor.constraint(equalTo: transferView.heightAnchor, multiplier: 0.4),
            transferAmountLabel.topAnchor.constraint(equalTo: transferAmountTextField.bottomAnchor),
            transferAmountLabel.leadingAnchor.constraint(equalTo: transferTextField.trailingAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(transferAmountLabelConstraints)
        
        let transferButtonConstraints = [
            transferButton.widthAnchor.constraint(equalTo: transferView.widthAnchor, multiplier: 0.1),
            transferButton.heightAnchor.constraint(equalTo: transferView.heightAnchor, multiplier: 0.3),
            transferButton.leadingAnchor.constraint(equalTo: transferAmountTextField.trailingAnchor, constant: 10),
            transferButton.topAnchor.constraint(equalTo: transferTitleLabel.bottomAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(transferButtonConstraints)
        
        let requestLoanTitleLabelConstraints = [
            requestLoanTitleLabel.widthAnchor.constraint(equalTo: requestLoanView.widthAnchor, multiplier: 1),
            requestLoanTitleLabel.heightAnchor.constraint(equalTo: requestLoanView.heightAnchor, multiplier: 0.25),
            requestLoanTitleLabel.topAnchor.constraint(equalTo: requestLoanView.topAnchor)
        ]
        
        NSLayoutConstraint.activate(requestLoanTitleLabelConstraints)
        
        let requestLoanTextFieldConstraints = [
            requestLoanTextField.widthAnchor.constraint(equalTo: requestLoanView.widthAnchor, multiplier: 0.4),
            requestLoanTextField.heightAnchor.constraint(equalTo: requestLoanView.heightAnchor, multiplier: 0.4),
            requestLoanTextField.leadingAnchor.constraint(equalTo: requestLoanView.leadingAnchor),
            requestLoanTextField.topAnchor.constraint(equalTo: requestLoanTitleLabel.bottomAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(requestLoanTextFieldConstraints)
        
        let requestLoanLabelConstraints = [
            requestLoanLabel.widthAnchor.constraint(equalTo: requestLoanView.widthAnchor, multiplier: 0.4),
            requestLoanLabel.heightAnchor.constraint(equalTo: requestLoanView.heightAnchor, multiplier: 0.4),
            requestLoanLabel.leadingAnchor.constraint(equalTo: requestLoanView.leadingAnchor),
            requestLoanLabel.topAnchor.constraint(equalTo: requestLoanTextField.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(requestLoanLabelConstraints)
        
        let requestLoanButtonConstraints = [
            requestLoanButton.widthAnchor.constraint(equalTo: requestLoanView.widthAnchor, multiplier: 0.1),
            requestLoanButton.heightAnchor.constraint(equalTo: requestLoanView.heightAnchor, multiplier: 0.3),
            requestLoanButton.leadingAnchor.constraint(equalTo: requestLoanTextField.trailingAnchor, constant: 10),
            requestLoanButton.topAnchor.constraint(equalTo: requestLoanTitleLabel.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(requestLoanButtonConstraints)
        
        
        let transactionsTitleConstraints = [
            transactionsTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            transactionsTitle.heightAnchor.constraint(equalToConstant: 40),
            transactionsTitle.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            transactionsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ]
        
        NSLayoutConstraint.activate(transactionsTitleConstraints)
        
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(tableViewConstraints)
        
    }

}

extension TransactionViewController: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as! TransactionTableViewCell
        return cell
    }
    
    
}
