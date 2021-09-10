//
//  arabicApp.swift
//  arabic
//
//  Created by Chris Price on 01/09/2021.
//

import SwiftUI

@main
struct arabicApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView() .environmentObject(WordDB())
        }
    }
}
