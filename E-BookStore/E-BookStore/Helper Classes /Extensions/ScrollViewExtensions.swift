//
//  ScrollViewExtensions.swift
//  Quick Fill
//
//  Created by Naveed-IOS on 02/10/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    func isReachedOnBottom(offset: CGFloat = 0 ) -> Bool {
        
        let height = self.frame.size.height
        let contentYoffset = self.contentOffset.y
        let distanceFromBottom = self.contentSize.height - contentYoffset
        if distanceFromBottom < height - offset {
           return true
        }
        return false
    }
    
    var isReachedOnTop : Bool {
        return self.contentOffset.y <= 0 ? true: false
    }
   
}


extension UIScrollView {
    var isBouncing: Bool {
        return isBouncingTop || isBouncingBottom
    }

    var isBouncingTop: Bool {
        return contentOffset.y < (topInsetForBouncing - contentInset.top)
    }

    var isBouncingBottom: Bool {
        let threshold: CGFloat
        if contentSize.height > frame.size.height {
            threshold = (contentSize.height - frame.size.height + contentInset.bottom + bottomInsetForBouncing)
        } else {
            threshold = topInsetForBouncing
        }
        return contentOffset.y > threshold
    }

    private var topInsetForBouncing: CGFloat {
        return safeAreaInsets.top != 0.0 ? -safeAreaInsets.top : 0.0
    }

    private var bottomInsetForBouncing: CGFloat {
        return safeAreaInsets.bottom
    }
}


////MARK:- tableview delegate
//extension ViewController: UITableViewDelegate, UIScrollViewDelegate {
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.isReachedOnBottom() {
//            print("Reached On Bottom")
//        }
//
//        if scrollView.isReachedOnTop {
//            print("Reached On Top")
//        }
//
//        if scrollView.isBouncingTop {
//            scrollView.backgroundColor = .red
//        } else if scrollView.isBouncingBottom {
//            scrollView.backgroundColor = .green
//        } else {
//            scrollView.backgroundColor = .white
//        }
//    }
//
//
//
//}


