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
            Spacer()
            
            VStack(alignment: .center){
                Text("You have done")
                Text(" \(userSettings.selectedProfile.actionHistory.count)")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                Text("actions this week that help the earth")
                    .multilineTextAlignment(.center)
            }
            .padding(.all)
            .frame(width: 200.0)
            .background(colorChoices[userSettings.selectedProfile.colorIndex].accent)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))

            Spacer()
            
            VStack(alignment: .center){
                Text("You have earned")
                Text(" \(userSettings.selectedProfile.points)")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                Text("Earth Points!")
            }
            .padding(.all)
            .frame(width: 200.0)
            .background(colorChoices[userSettings.selectedProfile.colorIndex].accent)

            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            
            Spacer()
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
