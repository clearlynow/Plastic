//
//  01 - HomeView.swift
//  Plastic
//
//  Created by Alison Gorman on 4/15/21.
//

import SwiftUI

public struct HomeView: View {
    @EnvironmentObject var userSettings: UserSettings
    
    public init(){}
    @State var progressDecicisons: Float = 0.75
    @State var progressGoal: Float = 0.55
    
    public var body: some View {

        
        VStack {
            Text("Hello \(userSettings.selectedProfile.name)!")
                .font(.largeTitle)
                .foregroundColor(colorChoices[userSettings.selectedProfile.colorIndex].primary)
            Text("")
            Text("You have made")
                .font(.headline)
            Text("5")
                .font(.largeTitle)
            Text("good decisions that help the earth!")
                .font(.headline)
            
            Spacer()
            
            HStack{
                ProgressCircle(progress:  self.$progressDecicisons)
                    .frame(width: 150.0, height: 150.0)
                    .padding(20.0)
                Text("75% of your decisions help the earth")
                }
            
            HStack{
                ProgressCircle(progress:  self.$progressGoal)
                    .frame(width: 150.0, height: 150.0)
                    .padding(20.0)
                Text("55% of your weekly goal has been met")
                }
            
            Spacer()
            }
        .padding(40)
        }
    
    }



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserSettings())
    }
}
