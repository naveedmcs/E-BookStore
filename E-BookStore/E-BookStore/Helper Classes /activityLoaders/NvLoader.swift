
import UIKit
import Foundation
//import NVActivityIndicatorView
////import PullToRefreshKit
//
//extension UIViewController: NVActivityIndicatorViewable {
//    //MARK:- LodingMessage
//    func showNvLoader() {
//        self.startAnimating(CGSize(width: 35, height: 35), message:nil, messageFont: UIFont.systemFont(ofSize: 10), type: NVActivityIndicatorType.ballTrianglePath, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
//
//    }
//    
//    func hideNvloader() {
//       self.stopAnimating()
//    }
//    
//    func showNavigationBarloader()  {
//       // self.view.isUserInteractionEnabled = false
//        let title = self.navigationItem.title ?? ""
//        NvLoader.shared.startAnimating(title: title, view: self.view, navigationItem: self.navigationItem)
//    }
//    
//    func hideNavigationBarLoader()   {
//       // self.view.isUserInteractionEnabled = true
//        NvLoader.shared.stopAnimating(self.navigationItem)
//    }
//}


//extension UITableView {
//    
//    func pullToRefresh(closure: @escaping () -> Void) {
//    
//        let header = DefaultRefreshHeader.header()
//        self.configRefreshHeader(with: header,container:self) { [weak self] in
//    
//            self?.backgroundView = nil
//            closure()
//    
//        }
//    }
//    
//    func stopLoader()  {
//         self.switchRefreshHeader(to: .normal(.none, 0))
//    }
//}
//
//extension UICollectionView {
//    
//    func pullToRefresh(closure: @escaping () -> Void) {
//        
//        let header = DefaultRefreshHeader.header()
//        self.configRefreshHeader(with: header,container:self) { [weak self] in
//            
//            self?.backgroundView = nil
//            closure()
//            
//        }
//    }
//    
//    func stopLoader()  {
//        self.switchRefreshHeader(to: .normal(.none, 0))
//    }
//}
//



class NvLoader {
    private init() {}
    
    //1
    static let shared = NvLoader()
    
    //2
    let activityLabel = UILabel(frame: CGRect(x: 24, y: 0, width: 0, height: 0))
    let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    let activityView = UIView()
    
    func startAnimating(title: String, view: UIView, navigationItem: UINavigationItem) {
        //3
        guard navigationItem.titleView == nil else { return }
        
        //4
        activityIndicator.style = .medium
        activityLabel.text = title
        activityLabel.textColor = .white
        //activityLabel.font = robotoBold18
       
        activityLabel.sizeToFit()
        
        //6
        let xPoint = view.frame.midX
        let yPoint = navigationItem.accessibilityFrame.midY
        let widthForActivityView = activityLabel.frame.width + activityIndicator.frame.width
        activityView.frame = CGRect(x: xPoint, y: yPoint, width: widthForActivityView, height: 30)
        
        activityLabel.center.y = activityView.center.y
        activityIndicator.center.y = activityView.center.y
        
        //7
        activityView.addSubview(activityIndicator)
        activityView.addSubview(activityLabel)
        
        //8
        navigationItem.titleView = activityView
        activityIndicator.startAnimating()
    }
    
    //9
    func stopAnimating(_ navigationItem: UINavigationItem) {
        activityIndicator.stopAnimating()
        navigationItem.titleView = nil
    }
}


extension UIButton {
    func loadingIndicator(_ show: Bool) {
        let tag = 808404
        if show {
            self.isEnabled = false
            self.alpha = 0.5
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
            indicator.tintColor = #colorLiteral(red: 0, green: 0.4899091721, blue: 0.9511727691, alpha: 1)
            indicator.tag = tag
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            self.isEnabled = true
            self.alpha = 1.0
            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
}


