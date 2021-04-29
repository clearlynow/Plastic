//
//  02 - StatsView.swift
//  Plastic
//
//  Created by Alison Gorman on 4/15/21.
//

import SwiftUI

public struct StatsView: View {
    
    @EnvironmentObject var userSettings: UserSettings
    public init(){}
    @State var progressDecicisons: Float = 0.75
    @State var progressGoal: Float = 0.55
    @State var progressAnimal: Float = 0.8
    @State var progressMonthly: Float = 0.2
    @State var progressDaily: Float = 0.75
    @State var progressPollution: Float = 0.40
    
    public var body: some View {

        ScrollView{
        VStack {
            Text("Your Stats")
            
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    ProgressCircle(progress:  self.$progressDecicisons)
                        .frame(width: 110.0, height: 110.0)
                        .padding(20.0)
                    Text("75% of your decisions help the earth")
                        .font(.body)
                    }
                VStack(alignment: .leading){
                    ProgressCircle(progress:  self.$progressGoal)
                        .frame(width: 110.0, height: 110.0)
                        .padding(20.0)
                    Text("55% of your weekly goal has been met")
                        .font(.body)
                    }
                }
            
            HStack(alignment: .top){
                VStack{
                    ProgressCircle(progress:  self.$progressAnimal)
                        .frame(width: 110.0, height: 110.0)
                        .padding(20.0)
                    Text("8% of your actions have killed an animal")
                        .font(.body)
                    }
                VStack{
                    ProgressCircle(progress:  self.$progressMonthly)
                        .frame(width: 110.0, height: 110.0)
                        .padding(20.0)
                    Text("20% of your monthly goal has been met")
                        .font(.body)
                    }
                }
            
            HStack(alignment: .top){
                VStack{
                    ProgressCircle(progress:  self.$progressDaily)
                        .frame(width: 120.0, height: 120.0)
                        .padding(20.0)
                    Text("75% of your daily goal has been met")
                        .font(.body)
                    }
                VStack{
                    ProgressCircle(progress:  self.$progressPollution)
                        .frame(width: 120.0, height: 120.0)
                        .padding(20.0)
                    Text("40% of your decisions have caused more pollution")
                        .font(.body)
                    }
                }
        
            Spacer()
            }
        .padding(40)
        }
    }
    }
