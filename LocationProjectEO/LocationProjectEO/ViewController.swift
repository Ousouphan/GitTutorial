//
//  ViewController.swift
//  LocationProjectEO
//
//  Created by mcs on 11/4/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
  
  let locationManager = CLLocationManager()
  var currentLocation: CLLocation? {
    didSet {
      guard let unwrappedLocation = currentLocation else { return }
      mapView.removeAnnotations(mapView.annotations)
      let annotation = MKPointAnnotation()
      annotation.coordinate = unwrappedLocation.coordinate
      mapView.addAnnotation(annotation)
      mapView.centerCoordinate = unwrappedLocation.coordinate
    }
  }

  @IBOutlet weak var mapView: MKMapView!
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
    //startUpdatingLocation
  }


}

extension ViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    currentLocation = locations.first
    
//    guard let location = locations.first else { return }
//    CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
//      guard let firstPlacemark = placemarks?.first, error == nil else { return
//
//      }
//      print(firstPlacemark.country)
//      print(firstPlacemark.locality)
//      print(firstPlacemark.timeZone)
//    }
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error.localizedDescription)
  }
  
}
