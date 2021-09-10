//
//  ViewController.swift
//  DoMapping
//
//  Created by Chris Price on 18/06/2021.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let elmHQ = MapNode(latitude: 24.747842, longitude: 46.623180, title: "Elm HQ", subtitle: "Headquarters of Elm Information Security Company")
        
       //Set a coordinate region with ElmHQ as centre and a kilometer span
        let regionSpan: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(
             center: elmHQ.coordinate,
             latitudinalMeters: regionSpan,
             longitudinalMeters: regionSpan)
       mapView.setRegion(coordinateRegion, animated: true)
       mapView.addAnnotation(elmHQ)

        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true

    }


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

