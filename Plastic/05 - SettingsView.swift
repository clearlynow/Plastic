//
//  05 - SettingsView.swift
//  Plastic
//
//  Created by Alison Gorman on 4/15/21.
//

import SwiftUI



public struct SettingsView: View {
    @EnvironmentObject var userSettings: UserSettings
    @State var selectedColorIndex = 0

        
    public init(){}

    
    public var body: some View {

        
        NavigationView{
            Form{

                Section(header: Text("Login")) {
                    Picker(selection: $userSettings.selectedProfile, label: Text("User")) {
                        ForEach(profiles) { profile in
                            Text(profile.name).tag(profile)
                        }
                    }
                }
                
                Section(header: Text("Goal")){
                    Stepper(value: $userSettings.selectedProfile.goal) {
                        Text("\(userSettings.selectedProfile.goal) actions per week")
                    }
                }
                                
                Section(header: Text("Customize Colors")){
                    Picker("Colors", selection: $userSettings.selectedProfile.colorIndex) {
                        ForEach(0 ..< colorChoices.count) {
                            (Text(colorChoices[$0].name) + Text(Image(systemName: "square.fill")).foregroundColor(colorChoices[$0].accent))
                                .tag($0)
                            }
                        }
                    }
                
                Section(header: Text("Start Screen")){
                    Toggle("Show start screen", isOn: $userSettings.selectedProfile.showStart)
                }
                
                }
            }
            .navigationTitle("Settings")
        }
    }


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
 
