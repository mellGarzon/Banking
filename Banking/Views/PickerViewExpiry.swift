//
//  PickerView.swift
//  Banking
//
//  Created by Mellani Garzon on 15/07/22.
//

import Foundation
import UIKit

protocol PickerViewExpirySelected {
    func expirySelected(month: String, year: String)
}

class PickerViewExpiry: NSObject, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var delegate: PickerViewExpirySelected?
    
    let expiryDate = [["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],["2022", "2023", "2024", "2025", "2026", "2027"]]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return expiryDate[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return expiryDate[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil{
            let month =  expiryDate[0][pickerView.selectedRow(inComponent: 0)]
            let year = expiryDate[1][pickerView.selectedRow(inComponent: 1)]

            delegate?.expirySelected(month: "\(month)", year: "\(year)")
        }
    }
    
}

