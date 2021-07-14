

//import Foundation
//import ImageSlideshow
//
//class ImageSlider {
//	
//	private var slideshow: ImageSlideshow
//	private var view: UIView
//	
//	init(slideshow: ImageSlideshow, view: UIView) {
//		self.slideshow = slideshow
//		self.view = view
//		
//		slideshow.slideshowInterval = 5.0
//		slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .customUnder(padding: -30))
//		slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
//		
//		let pageControl = UIPageControl()
//		pageControl.currentPageIndicatorTintColor = UIColor.lightGray
//		pageControl.pageIndicatorTintColor = UIColor.red
//		slideshow.pageIndicator = pageControl
//		// optional way to show activity indicator during image load (skipping the line will show no activity indicator)
//		slideshow.activityIndicator = DefaultActivityIndicator()
//		
////		self.slideshow.addTapGestureRecognizer {
////			 print("slideshow did tapped")
////		}
////
////		let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapSlideShow))
////		slideshow.addGestureRecognizer(recognizer)
//	}
//	
//	
////	 @objc private func didTapSlideShow() {
////		 print("slideshow did tapped")
////
////	 guard let viewController = self.view.findViewController() else {
////		 return print ("view controller not found")
////	 }
////
////		let fullScreenController = slideshow.presentFullScreenController(from: viewController)
////	 fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .medium, color: nil)
////	}
//	
//	func loadImages(urlStrings: [String] ) {
//		
//		var localSource:[KingfisherSource] = []
//		
//		for string in urlStrings {
//			if let url = KingfisherSource(urlString: string) {
//				localSource.append(url)
//
//			}
//			
//		}
//		
//		slideshow.setImageInputs(localSource)
//		
//	}
//	
//}
