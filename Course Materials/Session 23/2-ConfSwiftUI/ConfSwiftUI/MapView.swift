//
//  MapView.swift
//  ConfSwiftUI
//
//  Created by Chris Price on 30/08/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    let mapNode: MapNode
    
    @State var region = MKCoordinateRegion( center: CLLocationCoordinate2D(latitude: 52.416367000000001, longitude: -4.0662989999999999),
             latitudinalMeters: CLLocationDistance(500),
             longitudinalMeters: CLLocationDistance(500) )
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: [], showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: [mapNode]){ item in
            MapPin(coordinate: mapNode.coordinate)
        }
            .navigationTitle( mapNode.title)
            .navigationBarTitleDisplayMode(.inline)
     }
    
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapNode: MapNode(location: Location(id: "b23", name: "Llandinam B23", latitude: 52.416367000000001, longitude: -4.0662989999999999, placeDescription: "The Hack on Thursday afternoon and evening will be run in this workroom.")))
    }
    

}
 
