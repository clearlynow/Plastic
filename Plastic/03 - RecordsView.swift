//
//  03 - RecordsView.swift
//  Plastic
//
//  Created by Alison Gorman on 4/15/21.
//

import SwiftUI

public struct RecordsView: View {
    @EnvironmentObject var userSettings: UserSettings
    public init(){}

    
    public var body: some View {
        VStack{
            Spacer()
            Text ("Daily Streak")
            
            Spacer()
            
            VStack{
                HStack{
                    Image(systemName: "checkmark.circle.fill")
                    Image(systemName: "checkmark.circle.fill")
                    Image(systemName: "checkmark.circle.fill")
                    Image(systemName: "checkmark.circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                }
                .padding(20)
                HStack{
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                }
                .padding(20)
                HStack{
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                }
                .padding(20)
                HStack{
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                    Image(systemName: "circle.fill")
                }
                .padding(20)
            }
            .padding(20)
            
            Spacer()
            
            Text ("Keep going to unlock more records!")
            Spacer()
        }
        

    
    }
}

