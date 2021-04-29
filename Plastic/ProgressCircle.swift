//
//  progressCircle.swift
//  Plastic
//
//  Created by Alison Gorman on 4/15/21.
//

import SwiftUI

struct ProgressCircle: View {
    @EnvironmentObject var userSettings: UserSettings
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(colorChoices[userSettings.selectedProfile.colorIndex].accent)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(colorChoices[userSettings.selectedProfile.colorIndex].accent)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .font(.largeTitle)
                .bold()
        }
    }
}
