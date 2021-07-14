//
//  ResizeImageExtension.swift
//  Baqala
//
//  Created by apple on 2/28/19.
//  Copyright © 2019 My Technology. All rights reserved.
//
import UIKit
import Photos


extension UIImage {
  
    func resizeImage(newHeight: CGFloat = 1000 ) -> UIImage {
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    

    func getFileSizeInMB ()-> String {
        
        
        let img1Data: NSData  = NSData(data: self.jpegData(compressionQuality: 0.0)!)
        
        let byteCount = img1Data.count// replace with data.count
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useMB] // optional: restricts the units to MB only
        bcf.countStyle = .memory
        let string = bcf.string(fromByteCount: Int64(byteCount))
       // print(string)
        
        return string
    }
}



extension UIImage {
    
    //https://www.robertpieta.com/resize-uiimage-no-stretching-swift/
    
    func scalePreservingAspectRatio(targetSize: CGSize = CGSize(width: 1000, height: 1000)) -> UIImage {
       
      //  debugPrint("image orginal >  Size In MB:\(self.getFileSizeInMB())")
        
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        
      //  debugPrint("image resized > size in MB:\(scaledImage.getFileSizeInMB())")
        
        return scaledImage
    }
    
    // usage example
//    let image = // your image
//    let targetSize = CGSize(width: 100, height: 100)
//
//    let scaledImage = image.scalePreservingAspectRatio(
//        targetSize: targetSize
//    )
}

extension UIImageView {
    
    //image text should not be contained
    func flipHorizantal(ImageName: String)  {
        let image = UIImage(named: ImageName)
        let flippedImage = image?.withHorizontallyFlippedOrientation()
        self.image = flippedImage
    }
    
}


extension PHAsset {
    var image: UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: self,
                             targetSize: CGSize(width: self.pixelWidth, height: self.pixelHeight),
                             contentMode: .aspectFit,
                             options: option,
                             resultHandler: {(result, info) -> Void in
                                thumbnail = result!
        })
        return thumbnail
    }
}
