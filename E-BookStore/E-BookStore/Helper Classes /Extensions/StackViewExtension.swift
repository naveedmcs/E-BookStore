//
//  StackViewExtension.swift
//  Quick Fill
//
//  Created by Naveed-IOS on 09/09/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    public func animate(viewsHidden: [UIView] = [], viewsVisible: [UIView] = [], animated: Bool = true ) {
        let viewsHidden = viewsHidden.filter({ $0.superview === self })
        let viewsVisible = viewsVisible.filter({ $0.superview === self })

        let blockToSetVisibility: ([UIView], _ hidden: Bool) -> Void = { views, hidden in
            views.forEach({ $0.isHidden = hidden })
        }

        // need for smooth animation
        let blockToSetAlphaForSubviewsOf: ([UIView], _ alpha: CGFloat) -> Void = { views, alpha in
            views.forEach({ view in
                view.subviews.forEach({ $0.alpha = alpha })
            })
        }

        if !animated {
            blockToSetVisibility(viewsHidden, true)
            blockToSetVisibility(viewsVisible, false)
            blockToSetAlphaForSubviewsOf(viewsHidden, 1)
            blockToSetAlphaForSubviewsOf(viewsVisible, 1)
        } else {
            // update hidden values of all views
            // without that animation doesn't go
            let allViews = viewsHidden + viewsVisible
            self.layer.removeAllAnimations()
            allViews.forEach { view in
                let oldHiddenValue = view.isHidden
                view.layer.removeAllAnimations()
                view.layer.isHidden = oldHiddenValue
            }

            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           usingSpringWithDamping: 0.9,
                           initialSpringVelocity: 1,
                           options: [],
                           animations: {

                            blockToSetAlphaForSubviewsOf(viewsVisible, 1)
                            blockToSetAlphaForSubviewsOf(viewsHidden, 0)

                            blockToSetVisibility(viewsHidden, true)
                            blockToSetVisibility(viewsVisible, false)
                            self.layoutIfNeeded()
            },
                           completion: nil)
        }
    }
}
