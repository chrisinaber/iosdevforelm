//
//  ContentView.swift
//  arabic
//
//  Created by Chris Price on 01/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var wordDB: WordDB
    @State var gettingNewWord = false
    
    var body: some View {
        NavigationView {
        List{
            if wordDB.wordList.isEmpty {
                Text("List is empty")
            }
            ForEach (wordDB.wordList) {word in
                HStack {
                    VStack(alignment: .leading){
                        Text("Arabic:")
                        Text("English:")
                        Text("Word type:")
                    }.padding(.trailing)
                    VStack(alignment: .leading){
                        Text(word.arabicWord)
                        Text(word.englishWord).foregroundColor(.green)
                        Text(word.wordType)
                    }
                }
            }
        } .navigationTitle( "Word List")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing: HStack {
                Button(action: { gettingNewWord.toggle() },
                       label: {
                    Image(systemName: "plus.circle")
                })
                    .sheet(
                        isPresented: $gettingNewWord,
                        content: {
                            AddWordView(showForm: $gettingNewWord)
                        }
                    )
            } )
        } .navigationViewStyle(StackNavigationViewStyle())
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(WordDB())
    }
}
