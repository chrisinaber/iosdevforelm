//
//  ContentView.swift
//  Animal3
//
//  Created by Chris Price on 03/09/2021.
//

import SwiftUI

var categories = [
    [["Dogs"], [ "Collie", "Labrador", "Dalmation",
                 "Doberman", "Afghan"]],
    [["Cats"], ["Siamese", "Manx", "Persian"]],
    [["Rabbits"], ["Dutch", "Chinchilla", "Lionhead"]]]


struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                ForEach((0...2), id: \.self) { index in
                    Text( categories[index][0][0])
                    AnimalListView(animals: categories[index][1])
                }
            } .navigationTitle( "Animals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
                  ContentView().preferredColorScheme($0)
        }
    }
}

struct AnimalListView: View {
    let animals: [String]
    var body: some View {
        ForEach(animals, id: \.self) {animal in
            NavigationLink(
                destination: Image(animal)
                    .resizable()
                    .frame(width: 300, height: 300),
                label: {
                    HStack {
                         Image(animal)
                            .resizable()
                            .frame(width: 70, height: 70)
                         Text(animal)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                         Spacer()
                    }.background(Color(.yellow))
                })
        }
    }
}
