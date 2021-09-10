//
//  Location.swift
//
//  Created by Chris Price on 18/06/2021.
//

import Foundation
import MapKit

/// This is the location read from JSON
struct Location: Codable, Identifiable {
    var id: String
    var name: String
    var latitude: Double
    var longitude: Double
    var placeDescription: String
   
}

/// This is the set of details used to put an annotation on the map
struct MapNode: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
    let subtitle: String
    
    init(location: Location) {
        coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        title = location.name
        subtitle = location.placeDescription
    }
}


