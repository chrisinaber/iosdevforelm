//
//  ProgramView.swift
//  ConfSwiftUI
//
//  Created by Chris Price on 30/08/2021.
//

import SwiftUI

struct ProgramView: View {
    @EnvironmentObject var programData: ConferenceData

    var body: some View {
        NavigationView {
            List{
                ForEach(programData.dates,id: \.self) { date in
                   SectionHeaderView(header: date[0])
                   ForEach(programData.orderedTalksOnDate(date: date[1])) { item in
                    if item.sessionType != "talk" {
                        SimpleItemView(simpleItem: item)
                    } else {
                        NavigationLink(
                            destination: TalkDetailView(talk: item, day: date[0]),
                            label: {
                                ProgramItemView(programItem: item )
                            })
                    }
                  }
                }
            } .navigationTitle( "iOSDevUK 2019")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SectionHeaderView: View {
    let header: String

    var body: some View {
        ZStack{
            Color(.systemGray)
            Text( header )
                .font(.title2)
                .bold()
                .padding([.leading,.trailing])
        }
    }
}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView().environmentObject(ConferenceData())
    }
}
 
