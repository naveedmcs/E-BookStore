//
//  ImagePickerExtension.swift
//  ImagePlacePicker
//
//  Created by apple on 11/27/19.
//  Copyright © 2019 mytechnology. All rights reserved.
//

import UIKit
import TOCropViewController

 


class NvImagePicker: NSObject {
    
    //MARK:-  completion handler closures
    var didSelect:((_ image: UIImage)-> Void)?
    //var didOpenImageCropPicker:(()-> Void)?
    
    //MARK:- private variables
    private var viewController: UIViewController?
    
    private struct alertPicker {
        static var title = "Title"
        static var message = "Choose Option"
        static var camera = "Camera"
        static var photo = "Photo Library"
        static var cancel = "Cancel"
    }
    
    
    
    
    func open(allowsEditingPhotoLibrary: Bool = false,
              allowsEditingCamera: Bool = false,  viewController: UIViewController?) {
        
        self.viewController = viewController
       
    
        let alert = UIAlertController(title: alertPicker.message, message: nil, preferredStyle: .actionSheet)
        
       
        
        alert.addAction(UIAlertAction(title: alertPicker.photo, style: .default , handler:{ (UIAlertAction)in
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
           // imagePicker.allowsEditing = allowsEditingPhotoLibrary
            imagePicker.delegate = self
            imagePicker.modalPresentationStyle = .fullScreen
            imagePicker.navigationBar.isTranslucent = false
            imagePicker.navigationBar.barTintColor = .blue // Background color
            imagePicker.navigationBar.tintColor = .white // Cancel button ~ any UITabBarButton items
            imagePicker.navigationBar.titleTextAttributes = [
                    NSAttributedString.Key.foregroundColor: UIColor.white
            ] // Title color
            
            viewController?.present(imagePicker, animated: true)
        }))
        
        
        alert.addAction(UIAlertAction(title: alertPicker.camera , style: .default , handler:{ (UIAlertAction)in
            
            let vc = UIImagePickerController()
            vc.sourceType = .camera
           // vc.isEditing = allowsEditingCamera
            vc.delegate = self
			//let controller = UIApplication.shared.windows.first?.rootViewController
            viewController?.present(vc, animated: true)
            
        }))
        
        alert.addAction(UIAlertAction(title: alertPicker.cancel , style: .cancel , handler:{ (UIAlertAction)in
            
            print("Cancel")
            
        }))
        
		//let controller = UIApplication.shared.windows.first?.rootViewController
        //controller?.modalPresentationStyle = .fullScreen
        
        viewController?.present(alert, animated: true)
    }
 

}


extension NvImagePicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //        picker.dismiss(animated: true)
        var selectedImage = UIImage()
        
        if let image = info[.originalImage] as? UIImage  {
            
            print(image.size)
            selectedImage = image
           // self.didSelect?(image)
           
            
        }
       
        if let image = info[.editedImage] as? UIImage {
             print(image.size)
            // self.didSelect?(image)
             selectedImage = image
        }
        
        if picker.sourceType == .camera {
            //image saver
            ImageSaver().writeToPhotoAlbum(image: selectedImage)
        }
        
      
        picker.dismiss(animated: true) {
            self.openImageRotateCropViewController(image: selectedImage, viewController: self.viewController)
        }
        
    }
    
    
    
}




extension NvImagePicker {
    func openImageRotateCropViewController(image: UIImage?, viewController: UIViewController?) {
        guard let image = image else { return }
         let cropViewController = TOCropViewController(image: image)
         cropViewController.delegate = self
         viewController?.present(cropViewController, animated: true, completion: nil)
    }
}

extension NvImagePicker: TOCropViewControllerDelegate {
    func cropViewController(_ cropViewController: TOCropViewController, didCropTo image: UIImage, with cropRect: CGRect, angle: Int) {
        self.didSelect?(image)
       
        cropViewController.dismiss(animated: true, completion: nil)
    }
    

}
