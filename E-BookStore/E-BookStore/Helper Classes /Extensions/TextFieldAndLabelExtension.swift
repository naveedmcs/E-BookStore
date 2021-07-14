//
//  TextFieldExtension.swift
//  AnimalLover
//
//  Created by Muhammad Naveed on 4/23/20.
//  Copyright © 2020 Tech nerds. All rights reserved.
//

import UIKit

private var kAssociationKeyMaxLength: Int = 0


enum AcceptInputType: Int {
    case alphabet = 1
    case alphaNumaric = 2
    case numbers = 3
    case email = 4
}

private var kAssociationKeyDefaultAcceptInputTypeValue: AcceptInputType = .alphabet

extension UITextField {

    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }

    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
            prospectiveText.count > maxLength
            else {
                return
        }

        let selection = selectedTextRange

        let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        let substring = prospectiveText[..<indexEndOfText]
        text = String(substring)

        selectedTextRange = selection
    }
    
//    @IBInspectable var inputType: Int {
//        get {
//            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
//                return length
//            } else {
//                return Int.max
//            }
//        }
//        set {
//            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
//            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
//        }
//    }
//
//    @objc func checkMaxLength(textField: UITextField) {
//        guard let prospectiveText = self.text,
//            prospectiveText.count > maxLength
//            else {
//                return
//        }
//
//        let selection = selectedTextRange
//
//        let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
//        let substring = prospectiveText[..<indexEndOfText]
//        text = String(substring)
//
//        selectedTextRange = selection
//    }
    
    
    
    
    
    
}


extension UITextField {
    
    func createShadow()  {
        //self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = false
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
}


extension UIViewController {
    func createShadow(_ textFields: [UITextField], buttons: [UIButton]? = nil, textViews: [UITextView]? = nil)  {
        for tf in textFields {
            tf.createShadow()
        }
        if let buttons = buttons {
            for button in buttons {
                button.clipsToBounds = false
                button.layer.shadowOpacity = 0.2
                button.layer.shadowOffset = CGSize(width: 0, height: 0)
            }
        }
        
        if let textViews = textViews {
            for textView in textViews {
                textView.clipsToBounds = false
                textView.layer.shadowOpacity = 0.2
                textView.layer.shadowOffset = CGSize(width: 0, height: 0)
            }
        }
    }
    

}

extension UILabel {
    func textWidth() -> CGFloat {
        return UILabel.textWidth(label: self)
    }
    
    class func textWidth(label: UILabel) -> CGFloat {
        return textWidth(label: label, text: label.text!)
    }
    
    class func textWidth(label: UILabel, text: String) -> CGFloat {
        return textWidth(font: label.font, text: text)
    }
    
    class func textWidth(font: UIFont, text: String) -> CGFloat {
        let myText = text as NSString
        
        let rect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(labelSize.width)
    }
}
