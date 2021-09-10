//
//  ContentView.swift
//  SpeakerCreator
//
//  Created by Chris Price on 08/09/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        NavigationView {
            List{
                if viewModel.speakerList.allSpeakers.isEmpty {
                    Text("List is empty")
                }
                ForEach (viewModel.speakerList.allSpeakers) {speaker in
                    HStack {
                        VStack(alignment: .leading){
                            Text("Name:")
                            Text("Biography:")
                            Text("Twitter:")
                        }.padding(.trailing)
                        VStack(alignment: .leading){
                            Text("\(speaker.name)").foregroundColor(.green)
                            Text("\(speaker.biography)")
                            Text("\(speaker.twitter)")
                        }
                    }
                }
            }
            .navigationTitle( "Speakers")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    NavigationLink( destination: SpeakerEntryForm(),  label: {
                        Image(systemName: "plus.circle")
                    })
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
