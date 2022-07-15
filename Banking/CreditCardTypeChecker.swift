//
//  Checking.swift
//  Banking
//
//  Created by Mellani Garzon on 14/07/22.
//

import Foundation

enum CreditCardType {
    
    case visa
    case mastercard
    case americanExpress
    
    static var all: [CreditCardType] {
        return [
            .visa,
            .mastercard,
            .americanExpress,
        ]
    }
    
    var pattern: String {
        switch self {
        case .visa: return "^4[0-9]{12}(?:[0-9]{3})?$"
        case .mastercard: return "^5[1-5][0-9]{14}$"
        case .americanExpress: return "^3[47][0-9]{13}$"
        }
    }

}


struct CreditCardTypeChecker {
    
    static func type(for value: String) -> CreditCardType? {
        for creditCardType in CreditCardType.all {
            if isValid(for: creditCardType, value: value) {
                return creditCardType
            }
        }
        return nil
    }
    
    static func isValid(for cardType: CreditCardType, value: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: cardType.pattern,
                                                options: .caseInsensitive)
            
            return regex.matches(in: value,
                                 options: [],
                                 range: NSMakeRange(0, value.count)).count > 0
        } catch {
            return false
        }
    }
}
