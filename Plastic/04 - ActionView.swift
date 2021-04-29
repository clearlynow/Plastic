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
    @State var actions = ["Recycle", "Pick Up Trash", "Use a reusable water bottle"]
    

    
    public init(){}

    func addNewAction(){
        actions.insert(newAction, at: 0)
        newAction = ""
    }
    
    public var body: some View {
        VStack{
            TextField("Insert Action Here", text: $newAction)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(20)
            Button(action: {
                    addNewAction()
            }) {
                Text("Go!")
                    .font(.largeTitle)
            }
            
            List(actions, id: \.self) {
                Image(systemName: "\($0.count).circle")
                Text($0)
            }
        }
        

    
    }
}
