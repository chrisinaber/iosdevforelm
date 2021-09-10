//
//  ProgramItemView.swift
//  ConfSwiftUI
//
//  Created by Chris Price on 30/08/2021.
//

import SwiftUI

struct ProgramItemView: View {
    @EnvironmentObject var programData: ConferenceData
    
    let programItem: Talk
    var body: some View {
        HStack {
                VStack(alignment: .leading) {
                    Text(programItem.timeStart)
                    Text(programItem.timeEnd)
                        .foregroundColor(
                            Color(.systemGray))
                }
                VStack(alignment: .leading) {
                    Text(programItem.title)
                    Text(programData.speakerNameFromId(id: programItem.speakerId))
                        .foregroundColor(fontGreen)
                }
                .padding(.leading)
                Spacer()
            }
            .font(.headline)
            .padding(10)
    }
}


struct ProgramItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramItemView(programItem: Talk(id: "ibawesome", title: "Interface Builder considered awesome", content: "Storyboards and XIBs create horrible merge-conficts in teams, are unreviewable in Pull-Requests and they don't even support comments. So no responsible developer in a team should ever be using Interface Builder for a serious iOS project, right?", locationId: "physmain", sessionDate: "2019-12-13", sessionOrder: 4, timeStart: "11:20", timeEnd: "12:00", sessionType: "talk", speakerId: "JoachimKurz")).environmentObject(ConferenceData())
    }
}


