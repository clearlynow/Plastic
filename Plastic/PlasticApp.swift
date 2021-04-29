//
//  PlasticApp.swift
//  Plastic
//
//  Created by Alison Gorman on 4/15/21.
//

import SwiftUI

@main
struct PlasticApp: App {
    @StateObject var userSettings = UserSettings()
    
    var body: some Scene {
        
        WindowGroup {
            ContentView().environmentObject(userSettings)
                .accentColor(Color(UIColor.systemTeal))
        }
    }
}
