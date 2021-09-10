//
//  SimpleItemView.swift
//  ConfSwiftUI
//
//  Created by Chris Price on 30/08/2021.
//

import SwiftUI

struct SimpleItemView: View {
    @EnvironmentObject var programData: ConferenceData

    let simpleItem: Talk
    var body: some View {
        ZStack {
            cellYellow
            HStack {
                VStack(alignment: .leading) {
                    Text(simpleItem.timeStart)
                        .foregroundColor(Color(.black))
                    Text(simpleItem.timeEnd)
                        .foregroundColor(Color(.systemGray))
                    }
                Text(simpleItem.title)
                    .foregroundColor(Color(.black))
                    .padding(.leading)
                
                NavigationLink(
                    destination:  MapView(mapNode: MapNode(location: programData.locationFromId(id: simpleItem.locationId))),
                    label: {
                        Spacer()
                        Text(programData.locationNameFromId(id: simpleItem.locationId))
                        Image(systemName: "info.circle")
        
                    })
                    .foregroundColor(Color(.systemBlue))
                
            }
            .font(.headline)
            .padding(10)
        }
        
    }
}

struct SimpleItemView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleItemView(simpleItem: Talk(id: "1", title: "Coffee Break", content: "", locationId: "physmain", sessionDate: "2019-12-13", sessionOrder: 4, timeStart: "11:20", timeEnd: "12:00", sessionType: "break", speakerId: "")).environmentObject(ConferenceData())
    }
}
