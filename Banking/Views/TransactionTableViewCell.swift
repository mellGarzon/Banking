//
//  TransactionTableViewCell.swift
//  Banking
//
//  Created by Mellani Garzon on 19/07/22.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    static let identifier = "transactionTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Paypal"
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "June 28"
        return label
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-$12.000"
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(valueLabel)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 30
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 0.5
        addConstraints()
    }

    func addConstraints() {
        let titleLabelConstraints = [
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        
        let dateLabelConstraints = [
            dateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            dateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ]
        
        NSLayoutConstraint.activate(dateLabelConstraints)
        
        let valueLabelConstraints = [
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            valueLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            valueLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(valueLabelConstraints)
        
    }

}
