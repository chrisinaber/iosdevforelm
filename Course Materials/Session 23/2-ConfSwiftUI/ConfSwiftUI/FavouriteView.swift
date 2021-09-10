//
//  FavouriteView.swift
//  ConfSwiftUI
//
//  Created by Chris Price on 30/08/2021.
//

import SwiftUI

struct FavouriteView: View {
    @EnvironmentObject var programData: ConferenceData
    var body: some View {
        NavigationView {
            List{
                ForEach(programData.dates,id: \.self) { date in
                    SectionHeaderView(header: date[0])
                    VStack{
                        if programData.orderedFavouritesOnDate(date: date[1]) == [] {
                            Text("There are no favourites on \(date[0])")
                        }
                        ForEach(programData.orderedFavouritesOnDate(date: date[1])) { item in
                            NavigationLink(
                                destination: TalkDetailView(talk: item, day: date[0]),
                                label: {
                                    ProgramItemView(programItem: item )
                                })
                        }
                    }
                }
            }.navigationTitle( "Favourites")
        }.navigationViewStyle(StackNavigationViewStyle())

    }
    
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView().environmentObject(ConferenceData())
    }
}
