//
//  TalkDetailView.swift
//  ConfSwiftUI
//
//  Created by Chris Price on 30/08/2021.
//

import SwiftUI

struct TalkDetailView: View {
    @EnvironmentObject var programData: ConferenceData
    
    let talk: Talk
    let day: String

    var body: some View {
        VStack{
            Text( talk.title )
                .font(.title)
                .padding(.top, 30)
            NavigationLink(
                destination: SpeakerItemView(speaker: programData.speakerFromId(id: talk.speakerId)),
                label: {
                    Text(programData.speakerNameFromId(id: talk.speakerId) )
                })
                .padding(.top, 30)
                
            ZStack {
                cellGreen
                VStack(alignment: .leading) {
                    Text( talk.content )
                        .padding()
                    Spacer()
                }
            }
            .padding(30)
            Spacer()
            HStack{
                Text( "Location:  " )
                NavigationLink(
                    destination: MapView(mapNode: MapNode(location: programData.locationFromId(id: talk.locationId))),
                    label: {
                        Text(programData.locationNameFromId(id: talk.locationId))
                    })
            }
                .padding(.bottom, 30)
        }
        .navigationTitle( "\(day) \(talk.timeStart)")
        .navigationBarItems(
            trailing: HStack {
                Button(action: {toggleFavourite(talk: talk)}, label: {
                    Image(systemName: programData.isFavourite(talk: talk) ?
                            "star.fill" : "star")
                })

            } )
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    func toggleFavourite( talk: Talk) {
        if programData.isFavourite(talk: talk) {
            programData.removeFavourite(talk: talk)
        } else {
            programData.addFavourite(talk: talk)

        }
    }
}



struct TalkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TalkDetailView(talk: Talk(id: "ibawesome", title: "Interface Builder considered awesome", content: "Storyboards and XIBs create horrible merge-conficts in teams, are unreviewable in Pull-Requests and they don't even support comments. So no responsible developer in a team should ever be using Interface Builder for a serious iOS project, right?", locationId: "physmain", sessionDate: "2019-12-13", sessionOrder: 4, timeStart: "11:20", timeEnd: "12:00", sessionType: "talk", speakerId: "JoachimKurz"), day: "Monday").environmentObject(ConferenceData())
    }
}
 
