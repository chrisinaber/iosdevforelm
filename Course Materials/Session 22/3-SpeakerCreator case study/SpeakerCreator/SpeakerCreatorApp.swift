//
//  SpeakerCreatorApp.swift
//  SpeakerCreator
//
//  Created by Chris Price on 08/09/2021.
//

import SwiftUI

@main
struct SpeakerCreatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
