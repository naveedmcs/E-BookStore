
//
//  Created by Muhammad Naveed on 10/2/18.
//  Copyright © 2018 Muhammad Naveed. All rights reserved.
//

import UIKit

// reusable class
class BaseTableView: UITableView {
    
    //MARK:- private properties
    var refresher = UIRefreshControl()
    var pullToRefresh: (() -> Void)?
      
    func setupRefreshControl() {
        refresher.addTarget(self, action: #selector(doSomething), for: .valueChanged)
          self.refreshControl = refresher
               
      }
     
      @objc private func doSomething(refreshControl: UIRefreshControl) {
          print("Hello World!")
             pullToRefresh?()
            //  self.refresher.endRefreshing()
      }
    
    
}


class SelfSizingTableView: BaseTableView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }

    override var intrinsicContentSize: CGSize {
        let height = min(.infinity, contentSize.height)
        return CGSize(width: contentSize.width, height: height)
    }
}


extension UITableView {
    
    func registerCell( id: String) {
        let nib = UINib(nibName: id, bundle: nil)
        self.register(nib, forCellReuseIdentifier: id)
    }
    func registerHeaderFooterCell( id: String) {
        let nib = UINib(nibName: id, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: id)
    }
    
    

}

extension UITableView {
    
    func reloadWithoutAnimation() {
        self.reloadData()
        let lastScrollOffset = contentOffset
        beginUpdates()
        endUpdates()
        layer.removeAllAnimations()
        setContentOffset(lastScrollOffset, animated: false)
    }
    
    func reloadSection(section: Int) {

        self.beginUpdates()
        self.reloadSections([section], with: .none)
        self.endUpdates()
        
    }
    
    
}


// reusable class
class BaseCollectionView: UICollectionView {
    
    //MARK:- private properties
    var refresher = UIRefreshControl()
    var pullToRefresh: (() -> Void)?
    
    func setupRefreshControl() {
        refresher.addTarget(self, action: #selector(doSomething), for: .valueChanged)
        self.refreshControl = refresher
        
    }
    
    @objc private func doSomething(refreshControl: UIRefreshControl) {
        print("Hello World!")
        pullToRefresh?()
        //  self.refresher.endRefreshing()
    }
}
    
    

extension UICollectionView {
    func registerCell( id: String) {
        let nib = UINib(nibName: id, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: id)
    }
    
    func registerCustomHeader(id: String)  {
        self.register(UINib(nibName: id, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: id)
        
    }
    func registerCustomFooter(id: String)  {
        self.register(UINib(nibName: id, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier:id)
    }
}




extension UITableView {
    
    func setEmptyView(title: String = "" , message: String = "No record found", imageName: String = "Logo") {
        
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let messageImageView = UIImageView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        messageImageView.backgroundColor = .clear
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageImageView)
        emptyView.addSubview(messageLabel)
        
        messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -100).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 8).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: emptyView.leadingAnchor).isActive = true

        messageLabel.trailingAnchor.constraint(equalTo: emptyView.trailingAnchor).isActive = true
        
        messageImageView.image = UIImage(named: imageName)
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 5
        messageLabel.textAlignment = .center
        
//        UIView.animate(withDuration: 1, animations: {
//
//            messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
//        }, completion: { (finish) in
//            UIView.animate(withDuration: 1, animations: {
//                messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
//            }, completion: { (finishh) in
//                UIView.animate(withDuration: 1, animations: {
//                    messageImageView.transform = CGAffineTransform.identity
//                })
//            })
//
//        })
        //messageImageView.topOffsetAnimate()
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        
        self.backgroundView = nil
        self.separatorStyle = .none
        
    }
    
}

extension UICollectionView {
    
    func setEmptyView(title: String = "Heads-up!" , message: String = "No record found", imageName: String = "Logo") {
        
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let messageImageView = UIImageView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        messageImageView.backgroundColor = .clear
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageImageView)
        emptyView.addSubview(messageLabel)
        
        messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -100
        ).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageImageView.image = UIImage(named: imageName)
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 4
        messageLabel.textAlignment = .center
        
//        UIView.animate(withDuration: 1, animations: {
//
//            messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
//        }, completion: { (finish) in
//            UIView.animate(withDuration: 1, animations: {
//                messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
//            }, completion: { (finishh) in
//                UIView.animate(withDuration: 1, animations: {
//                    messageImageView.transform = CGAffineTransform.identity
//                })
//            })
//
//        })
      //  messageImageView.topOffsetAnimate()
        self.backgroundView = emptyView
       
    }
    
    func restore() {
        
        self.backgroundView = nil
    
    }
    
}


extension UITableView {
    func scrollToBottomRow() {
        DispatchQueue.main.async {
            guard self.numberOfSections > 0 else { return }

            // Make an attempt to use the bottom-most section with at least one row
            var section = max(self.numberOfSections - 1, 0)
            var row = max(self.numberOfRows(inSection: section) - 1, 0)
            var indexPath = IndexPath(row: row, section: section)

            // Ensure the index path is valid, otherwise use the section above (sections can
            // contain 0 rows which leads to an invalid index path)
            while !self.indexPathIsValid(indexPath) {
                section = max(section - 1, 0)
                row = max(self.numberOfRows(inSection: section) - 1, 0)
                indexPath = IndexPath(row: row, section: section)

                // If we're down to the last section, attempt to use the first row
                if indexPath.section == 0 {
                    indexPath = IndexPath(row: 0, section: 0)
                    break
                }
            }

            // In the case that [0, 0] is valid (perhaps no data source?), ensure we don't encounter an
            // exception here
            guard self.indexPathIsValid(indexPath) else { return }

            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }

    func indexPathIsValid(_ indexPath: IndexPath) -> Bool {
        let section = indexPath.section
        let row = indexPath.row
        return section < self.numberOfSections && row < self.numberOfRows(inSection: section)
    }
}
