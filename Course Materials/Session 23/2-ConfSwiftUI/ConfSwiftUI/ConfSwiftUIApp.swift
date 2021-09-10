//
//  ConfSwiftUIApp.swift
//  ConfSwiftUI
//
//  Created by Chris Price on 30/08/2021.
//

import SwiftUI

@main
struct ConfSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ConferenceData())
        }
    }
}
