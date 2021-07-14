//
//  HyperLinkLable.swift
//  newqwwoo
//
//  Created by technerds on 13/03/2020.
//  Copyright © 2020 Tech nerds. All rights reserved.
//

import UIKit

extension NSAttributedString {
    func replace(placeholder: String, with hyperlink: String, url: String) -> NSAttributedString {
        let mutableAttr = NSMutableAttributedString(attributedString: self)
        
        let hyperlinkAttr = NSAttributedString(string: hyperlink, attributes: [NSAttributedString.Key.link: URL(string: url)!])
        
        let placeholderRange = (self.string as NSString).range(of: placeholder)
        
        mutableAttr.replaceCharacters(in: placeholderRange, with: hyperlinkAttr)
        return mutableAttr
    }
}

/*
 
 //Set through code or through interface builder
 textview.isSelectable = true
 textview.dataDetectorTypes = .link
 
 //Keeps the original formatting from xib or storyboard
 textview.text = "By continuing, you are indicating that you accept our @Terms@ and @Privacy@."
 textview.attributedText = textview.attributedText?
 .replace(placeholder: "@Terms@", with: "Terms and Conditions", url: AppUrl.terms)
 .replace(placeholder: "@Privacy@", with: "Privacy Policy", url: AppUrl.privacy)
 
 */
