//
//  00a - NavTabBar.swift
//  Plastic
//
//  Created by Alison Gorman on 4/15/21.
//


import SwiftUI

extension TabView {

    func myTabViewStyle() -> some View {
        self.background(Color(UIColor.systemTeal)).edgesIgnoringSafeArea(.all)
    }
}

public struct NavTabView: View {
    @EnvironmentObject var userSettings: UserSettings
    
    public init(){
        // UITabBar.appearance().barTintColor = UIColor.systemTeal //changes tabbar background
        UITabBar.appearance().backgroundColor = UIColor.systemTeal
    }
    public var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            StatsView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Score")
                }
            RecordsView()
                .tabItem {
                    Image(systemName: "hand.thumbsup")
                    Text("Records")
                }
            ActionView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Action")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
        .myTabViewStyle()

    }
}
    
