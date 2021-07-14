//
//  ImageViewController.swift
//  Quick Fill
//
//  Created by Naveed-IOS on 14/09/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

//import Foundation
//import Lightbox
//
//class ImageViewModel {
//    var image: UIImage?
//    var text: String?
//    var url: String?
//
//    init(image: UIImage? = nil , text: String? = nil, url: String? = nil) {
//        self.image = image
//        self.text = text
//        self.url =  url
//    }
//
//}
//
//class ImageViewController {
//
//    func present(images: [ImageViewModel], viewController: UIViewController, startIndex: Int? = nil) {
//
//        if images.count == 0 { return }
//
//        var lightBoxImages: [LightboxImage] = []
//
//       // DispatchQueue.global().async {
//
//            for model in images {
//                if let image = model.image  {
//                    let object = LightboxImage(image: image, text: model.text ?? "")
//                    lightBoxImages.append(object)
//                }
//                else {
//                    if let validString = model.url , let url = URL(string: validString ) {
//                        let object = LightboxImage(imageURL: url, text: model.text ?? "")
//                        lightBoxImages.append(object)
//                    }
//
//                }
//            }
//       // }
//
//        // Create an instance of LightboxController.
//
//        DispatchQueue.main.async {
//            let controller = LightboxController(images: lightBoxImages, startIndex: startIndex ?? 0)
//
//            // Set delegates.
//            controller.pageDelegate = self
//            controller.dismissalDelegate = self
//
//            // Use dynamic background.
//            controller.dynamicBackground = true
//
//            // Present your controller.
//            viewController.present(controller, animated: true, completion: nil)
//        }
//
//    }
//
//
////     func showImageVC(image:UIImage?, caption: String? = "")  {
////            guard let image = image , let caption = caption else {
////                Logger.log(message: "Image and caption not found")
////                return
////            }
////            // Create an array of images.
////            let images = [
////    //          LightboxImage(imageURL: URL(string: "https://cdn.arstechnica.net/2011/10/05/iphone4s_sample_apple-4e8c706-intro.jpg")!),
////              LightboxImage(
////                image: image,
////                text: caption
////              )
////            ]
////
////            // Create an instance of LightboxController.
////            let controller = LightboxController(images: images)
////
////            // Set delegates.
////            controller.pageDelegate = self
////            controller.dismissalDelegate = self
////
////            // Use dynamic background.
////            controller.dynamicBackground = true
////
////            // Present your controller.
////            present(controller, animated: true, completion: nil)
////        }
//
//}
//
//extension ImageViewController:  LightboxControllerPageDelegate, LightboxControllerDismissalDelegate {
//    func lightboxController(_ controller: LightboxController, didMoveToPage page: Int) {
//        print(page)
//    }
//
//    func lightboxControllerWillDismiss(_ controller: LightboxController) {
//
//    }
//
//
//}
