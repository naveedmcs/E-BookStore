//
//  NVLocationManager.swift
//  AnimalLover
//
//  Created by Muhammad Naveed on 3/30/20.
//  Copyright © 2020 Tech nerds. All rights reserved.
//
import Foundation
import CoreLocation
import UIKit


class NVLocationManager: NSObject, CLLocationManagerDelegate {

    static let shared = NVLocationManager()
    let locationManager : CLLocationManager
    var locationInfoCallBack: ((_ info:LocationInformation)->())!

    override init() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLLocationAccuracyHundredMeters
        super.init()
        locationManager.delegate = self
    }

	
	
	func askEnableLocationService() ->String {
		var showAlertSetting = false
		var showInitLocation = false
		if CLLocationManager.locationServicesEnabled() {
			switch CLLocationManager.authorizationStatus() {
			case .denied:
				showAlertSetting = true
				print("HH: kCLAuthorizationStatusDenied")
			case .restricted:
				showAlertSetting = true
				print("HH: kCLAuthorizationStatusRestricted")
			case .authorizedAlways:
				showInitLocation = true
				print("HH: kCLAuthorizationStatusAuthorizedAlways")
			case .authorizedWhenInUse:
				showInitLocation = true
				print("HH: kCLAuthorizationStatusAuthorizedWhenInUse")
			case .notDetermined:
				showInitLocation = true
				print("HH: kCLAuthorizationStatusNotDetermined")
			default:
				break
			}
		}else{
			showAlertSetting = true
			print("HH: locationServicesDisabled")

		}
		if showAlertSetting {
			let alertController = UIAlertController(title: "Alert", message: "Please enable location service in the settings", preferredStyle: .alert)
			let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in



				if let url = URL(string: UIApplication.openSettingsURLString) {
					UIApplication.shared.open(url, options: [:], completionHandler: nil)
				}

			}
			alertController.addAction(OKAction)
			
			if let rootController = UIApplication.shared.windows.first?.rootViewController {
				rootController.present(alertController, animated: true, completion: nil)
			}
			
		}
		if showInitLocation == true {

			return "YES"

		}
		return "NO"

	}

	
	
	
	
    func start(locationInfoCallBack:@escaping ((_ info:LocationInformation)->())) {
        self.locationInfoCallBack = locationInfoCallBack
       
		
		
		
		let status = CLLocationManager.authorizationStatus()

		  if(status == .denied || status == .restricted || !CLLocationManager.locationServicesEnabled()){
			_ = askEnableLocationService()
			  // show alert to user telling them they need to allow location data to use some feature of your app
			  return
		  }

		  // if haven't show location permission dialog before, show it to user
		  if(status == .notDetermined){
			_ = askEnableLocationService()
			  locationManager.requestWhenInUseAuthorization()
			  // if you want the app to retrieve location data even in background, use requestAlwaysAuthorization
			   locationManager.requestAlwaysAuthorization()
			  //return
		  }
		  
		  // at this point the authorization status is authorized
		  // request location data once
		  locationManager.requestLocation()
		_ = askEnableLocationService()
		
		  // start monitoring location data and get notified whenever there is change in location data / every few seconds, until stopUpdatingLocation() is called
		locationManager.startUpdatingLocation()
    }

    func stop() {
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let mostRecentLocation = locations.last else {
            return
        }
        print("Location Coordinats: \(mostRecentLocation)")
        let info = LocationInformation()
        info.latitude = mostRecentLocation.coordinate.latitude
        info.longitude = mostRecentLocation.coordinate.longitude
      //  mostRecentLocation.coordinate.longitude

        //now fill address as well for complete information through lat long ..
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(mostRecentLocation) { (placemarks, error) in
            guard let placemarks = placemarks, let placemark = placemarks.first else { return }
            if let city = placemark.locality,
                let state = placemark.administrativeArea,
                let zip = placemark.postalCode,
                let locationName = placemark.name,
                let thoroughfare = placemark.thoroughfare,
                let country = placemark.country {
                info.city     = city
                info.state    = state
                info.zip = zip
                info.address =  locationName + ", " + (thoroughfare as String)
                info.country  = country
            }
            self.locationInfoCallBack(info)
			print("NvLocationManager Status Info:\(info)")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        locationManager.stopUpdatingLocation()
    }
}

class LocationInformation {
    var city:String?
    var address:String?
    var latitude:CLLocationDegrees?
    var longitude:CLLocationDegrees?
    var zip:String?
    var state :String?
    var country:String?
    init(city:String? = "",address:String? = "",latitude:CLLocationDegrees? = Double(0.0),longitude:CLLocationDegrees? = Double(0.0),zip:String? = "",state:String? = "",country:String? = "") {
        self.city    = city
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.zip        = zip
        self.state = state
        self.country = country
    }
}
