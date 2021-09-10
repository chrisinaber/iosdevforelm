//
//  AddWordView.swift
//  arabic
//
//  Created by Chris Price on 01/09/2021.
//

import SwiftUI

struct AddWordView: View {
    
    @EnvironmentObject var wordDB: WordDB
    @Binding var showForm: Bool
    
    @State private var arabicWord = ""
    @State private var englishWord = ""
    @State private var wordType = 0
    static let wordTypes = ["Noun", "Verb", "Adjective", "Other" ]
    
    let cream = Color(red: 1.0, green: 0.956862745, blue: 0.874509804)
    
    var body: some View {
        VStack {
                Section(header: Text("Enter details of word to add")) {
                HStack{
                    Text("Arabic:")
                    Spacer()
                    TextField("Arabic", text: self.$arabicWord).frame(width: 150, alignment: .trailing).autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                HStack{
                    Text("English:")
                    Spacer()
                    TextField("English", text: self.$englishWord).frame(width: 150, alignment: .trailing).autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                }.padding()
                Section(header: Text("Get word type")) {
                       
                   Picker("Word Type:", selection: $wordType) {
                        ForEach(0 ..< Self.wordTypes.count, id: \.self) { Text(Self.wordTypes[$0]) }
                           
                    } .pickerStyle(SegmentedPickerStyle())
                }.padding()
            Button(action: {saveNewWord()})
            {
                Text("Save Word")
                    .frame(width: 200, height: 60)
                    .font(.largeTitle)
            }
            .background(Color.blue)
            .foregroundColor(cream)
            .cornerRadius(12)
            .padding()
            Spacer()
        }
    }
    
    func saveNewWord(){
        wordDB.addWord( newWord: VocabItem(englishWord: englishWord, arabicWord: arabicWord, wordType: Self.wordTypes[wordType]))
        showForm = false
    }
}

/*
 struct AddWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView()
    }
}
 */
