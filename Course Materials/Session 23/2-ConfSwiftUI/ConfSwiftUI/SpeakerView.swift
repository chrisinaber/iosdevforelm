//
//  SpeakerView.swift
//  ConfSwiftUI
//
//  Created by Chris Price on 30/08/2021.
//

import SwiftUI

struct SpeakerView: View {
    @EnvironmentObject var programData: ConferenceData
    var body: some View {
        NavigationView {
            List{
                ForEach(programData.allSpeakers) { speaker in
                    NavigationLink(
                        destination: SpeakerItemView(speaker: speaker),
                        label: {
                            HStack {
                                Image(speaker.id)
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text(speaker.name)
                                    .font(.title3)
                            }
                        })
                }
            } .navigationTitle( "Speakers")
        } .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct SpeakerView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerView().environmentObject(ConferenceData())
    }
}
