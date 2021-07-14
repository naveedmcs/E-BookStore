//
//  StringExtension.swift
//  newqwwoo
//
//  Created by technerds on 13/03/2020.
//  Copyright © 2020 Tech nerds. All rights reserved.
//

import Foundation
import UIKit


//https://www.swiftbysundell.com/articles/formatting-numbers-in-swift/
extension String {
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isValidEmail: Bool {
		let emailRegEx = "[A-Z0-9a-z._+-]{1,64}@[A-Za-z0-9.-]{1,64}\\.[A-Za-z]{2,10}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    var toIntValue: Int? {
        return  Int(self)
    }
    
    
    /// mask example: `+X (XXX) XXX-XXXX`
    func formatPhone(with mask: String = "(XXX) XXX-XXXX") -> String {
        let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
    
   
}


extension UITextField {
    static func maskPhoneNumber(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text =  newString.formatPhone()
        return false
    }
}



extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}

extension Dictionary {
    mutating func merge(dict: [Key: Value]?){
		guard let dict = dict else { return }
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}


extension String {
  func first(char:Int) -> String {
       return String(self.prefix(char))
   }

   func last(char:Int) -> String
   {
       return String(self.suffix(char))
   }

   func excludingFirst(char:Int) -> String {
       return String(self.suffix(self.count - char))
   }

   func excludingLast(char:Int) -> String
   {
        return String(self.prefix(self.count - char))
   }
    
    var toData: Data? {
       return self.data(using: .utf8)
    }
    var toURL: URL? {
       return URL(string: self)
    }
    
    func openUrl() {
        if let url = self.toURL {
            UIApplication.shared.open(url)
        }
    }
}

extension Int {
    var toString: String {
        return "\(self)"
    }
    
   
    
}

extension Bool {
    var toIntValue: Int {
        return self ? 1 : 0
    }
}
extension Int {
    var toBoolValue: Bool {
        return self != 0
    }
}






extension Double {
    
    static func formate(_ price: Double) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.groupingSeparator = ","
            numberFormatter.groupingSize = 3
            numberFormatter.usesGroupingSeparator = true
            numberFormatter.decimalSeparator = "."
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 2
            return numberFormatter.string(from: price as NSNumber)!
        }
    
    // print("InitData: result convert string " + Model.df2so(1008977.72))
    //InitData: result convert string "1,008,977.72"
    
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

