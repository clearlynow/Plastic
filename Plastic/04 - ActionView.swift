//
//  ActionView.swift
//  Plastic
//
//  Created by Alison Gorman on 4/15/21.
//

import SwiftUI

public struct ActionView: View {
    @EnvironmentObject var userSettings: UserSettings
    @State var newAction = ""
    //@State var actions = ["Recycle", "Pick Up Trash", "Use a reusable water bottle"]
    

    
    public init(){}

    //func addNewAction(){
    //    actions.insert(newAction, at: 0)
    //    newAction = ""
    //}
    
    public var body: some View {
        VStack{
            Text("What did you do?")
                .font(.largeTitle)
            
            Spacer()
           
            ForEach(0 ..< actions.count) { i in
                Button(action: {
                        //addNewAction()
                }) {
                    Text(actions[i].name)
                    Image(systemName: "\(abs(actions[i].points)).circle")
                }
                .padding(.all)
                .frame(width: 300.0)
                .background((actions[i].points > 0) ? colorChoices[userSettings.selectedProfile.colorIndex].accent : Color.red)
                .foregroundColor(colorChoices[userSettings.selectedProfile.colorIndex].primary)
                .clipShape(Capsule())
            }

            Spacer()
            
            Button(action: {
                    //addNewAction()
            }) {
                Text("Add/Edit Actions")
            }
            
            Spacer()
            
        }
    }
}

struct ActionView_Previews: PreviewProvider {
    static var previews: some View {
        ActionView().environmentObject(UserSettings())
    }
}
