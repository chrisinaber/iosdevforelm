//
//  MapListView.swift
//  ConfSwiftUI
//
//  Created by Chris Price on 31/08/2021.
//

import SwiftUI

struct MapListView: View {
    @EnvironmentObject var programData: ConferenceData
    var body: some View {
        NavigationView {
            List{
                ForEach(programData.allLocations) { location in
                    NavigationLink(
                        destination: MapView(mapNode: MapNode(location: location)),
                        label: {
                            HStack {
                                Image(location.id)
                                        .resizable()
                                        .frame(width: 120, height: 70, alignment: .center)
                                Text(location.name)
                                    .font(.title3)
                                
                            }
                        })
                }
            } .navigationTitle( "Locations")
        } .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MapListview_Previews: PreviewProvider {
    static var previews: some View {
        MapListView().environmentObject(ConferenceData())
    }
}
