//
//  SpeakerItemView.swift
//  ConfSwiftUI
//
//  Created by Chris Price on 30/08/2021.
//

import SwiftUI

struct SpeakerItemView: View {
    let speaker: Speaker
    var body: some View {
        VStack{
            Image(speaker.id)
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .padding(.top, 30)
            ZStack {
                cellGreen
                VStack(alignment: .leading) {
                    Text(speaker.biography)
                        .padding()
                    Spacer()
                }
            }
            .padding(30)
            Spacer()
            Text( "Twitter handle: @\(speaker.twitter)")
                .padding(.bottom, 30)
        } .navigationTitle(speaker.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SpeakerItemView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerItemView(speaker: Speaker(id: "ChrisPrice", name: "Chris Price", biography: "Not much to say about him", twitter: "iosdevuk" ))
    }
}
