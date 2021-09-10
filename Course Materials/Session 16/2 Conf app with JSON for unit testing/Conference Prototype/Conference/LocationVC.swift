//
//  LocationVC.swift
//  Conference
//
//  Created by Chris Price on 19/06/2021.
//

import UIKit
import MapKit

class LocationVC: UIViewController, CLLocationManagerDelegate {
    
    var chosenLocation: Location!
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = chosenLocation.name
        let place = MapNode(latitude: chosenLocation.latitude, longitude: chosenLocation.longitude, title: chosenLocation.name, subtitle: chosenLocation.placeDescription)
        
       //Set a coordinate region with ElmHQ as centre and a kilometer span
        let regionSpan: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(
             center: place.coordinate,
             latitudinalMeters: regionSpan,
             longitudinalMeters: regionSpan)
       mapView.setRegion(coordinateRegion, animated: true)
       mapView.addAnnotation(place)

        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true

    }
    
    class MapNode: NSObject, MKAnnotation {
        let coordinate: CLLocationCoordinate2D
        let title: String?
        let subtitle: String?
        
        init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String, subtitle: String) {
            coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            self.title = title
            self.subtitle = subtitle
        }
    }

}
