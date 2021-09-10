//
//  HomeView.swift
//  ConfSwiftUI
//
//  Created by Chris Price on 30/08/2021.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("ChosenTab") var selectedTab = 0

    var body: some View {
      TabView(selection: $selectedTab) {
          ProgramView()
            .tabItem { Image(systemName: "doc")
                Text("Programme")
            }
          .tag(0)
        FavouriteView()
            .tabItem { Image(systemName: "star.circle")
                Text("Favourites")
            }
          .tag(1)
        SpeakerView()
            .tabItem { Image(systemName: "person.2")
                Text("Speakers")
            }
          .tag(2)
        MapListView()
            .tabItem { Image(systemName: "map")
                Text("Locations")
                
            }
          .tag(3)
      }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
