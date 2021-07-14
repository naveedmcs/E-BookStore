//
//  DesignableView.swift
//  CoffeeShop
//
//  Created by apple on 2/18/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//


import UIKit

@IBDesignable class DesignableView: UIView {
}

@IBDesignable class DesignableButton: UIButton {
}

@IBDesignable class DesignableLabel: UILabel {
}

@IBDesignable class DesignableTextField: UITextField {
    

}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat  {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}


extension UITextField {
    
    func addleftPading(_ value : Int = 12){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: value, height: 45))
        leftView = view
        leftViewMode = .always
        
    }
    func addRightPading(_ value : Int = 12){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: value, height: 45))
        rightView = view
        rightViewMode = .always
    }
    func addleftRightPading(left : Int = 12, right: Int = 12){
        addleftPading(left)
        addRightPading(right)
    }

    // Proof of concept, not tested
    
    @IBInspectable var padding: Int{
        get { return 0 }  // maybe use associated objects, you can't add properties in extensions
        set {
           addleftRightPading(left : newValue, right: newValue)
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}





//// 1
//private var maxLengths = [UITextField: Int]()
//
//// 2
//extension UITextField {
//
//    // 3
//    @IBInspectable var maxLength: Int {
//        get {
//            // 4
//            guard let length = maxLengths[self] else {
//                return Int.max
//            }
//            return length
//        }
//        set {
//            maxLengths[self] = newValue
//            // 5
//            addTarget(
//                self,
//                action: #selector(limitLength),
//                for: UIControl.Event.editingChanged
//            )
//        }
//    }
//
//    @objc func limitLength(textField: UITextField) {
//        // 6
//        guard let string = textField.text, string.count > maxLength else {
//                return
//        }
//
//        let selection = selectedTextRange
//        // 7
//        text = string.substringWith(
//            Range<String.Index>(string.index(string.startIndex, offsetBy: 0) ..< string.index(start, offsetBy: maxLength)
//        )
//        selectedTextRange = selection
//    }
//
//    private func utf16Range(from range: NSRange) -> Range<String.UTF16Index>? {
//        guard range.location != NSNotFound else { return nil }
//        let start = string.index(string.startIndex, offsetBy: range.location)
//        let end = string.index(start, offsetBy: range.length)
//        return start..<end
//    }
//}
