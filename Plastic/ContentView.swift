//
//  ContentView.swift
//  Plastic
//
//  Created by Alison Gorman on 4/15/21.
//

import SwiftUI



// Custom Profiles
public struct CustomColors:  Identifiable, Hashable {
    public var id = UUID()
    var name: String
    var accent: Color
    var background: Color
    var primary: Color
    var secondary: Color
}

public struct Profile: Codable, Identifiable, Hashable {
    public var id = UUID()
    var name: String
    var colorIndex: Int
    var showStart: Bool
    var goal: Int
    var streak: Int
    
    init() {
        name = "name"
        colorIndex = 1
        goal = 10
        streak = 10
        showStart = false
    }
    
}


// Custom Data
    public var colorChoices = [CustomColors]()
    public var profiles = [Profile]()


    func getUsers() {
        profiles.append(Profile())
        profiles.append(Profile())
        profiles.append(Profile())
        
        profiles[0].name = "Katie"
        profiles[1].name = "Shannon"
        profiles[2].name = "Maya"
        
        colorChoices.append(CustomColors(name: "Blues", accent: Color(UIColor.systemTeal), background: Color(UIColor.systemBackground), primary: Color(UIColor.label), secondary: Color(UIColor.secondaryLabel)))
        colorChoices.append(CustomColors(name: "Greens", accent: Color(UIColor.systemGreen), background: Color(UIColor.systemBackground), primary: Color(UIColor.label), secondary: Color(UIColor.secondaryLabel)))
    }



class UserSettings: ObservableObject {

    @Published var selectedProfile : Profile {
        didSet{
            //saves settings changes to profiles array where names match
            profiles.indices.filter {profiles[$0].name == selectedProfile.name}
                .forEach {profiles[$0] = selectedProfile}
            //UserDefaults.standard.set(selectedProfile, forKey: "profile")
        }
    }
    
    init() {
        getUsers()
        self.selectedProfile = profiles[0]
        //self.selectedProfile = UserDefaults.standard.object(forKey: "profile") as? Profile ?? profiles[0]
        }
}

   
struct ContentView: View {
    @EnvironmentObject var userSettings: UserSettings
    @State var showStart = true
    
    var body: some View {
       Group {
        if userSettings.selectedProfile.showStart {
                StartView()
            } else {
                NavTabView()
            }
        }
       .accentColor(colorChoices[userSettings.selectedProfile.colorIndex].accent)
    }
    
}


struct StartView: View {

    @EnvironmentObject var userSettings: UserSettings
    @State var scale: CGFloat = 1.0
    
    func animateBottle() {
        let baseAnimation = Animation.easeIn(duration: 2)
        //let repeated = baseAnimation.repeatForever(autoreverses: true)
        
        withAnimation(baseAnimation) {
            scale = 10
        }
    }
    
    public var body: some View {
        VStack {
            Spacer()
            
            Image("bottle")
                .renderingMode(.template)
                .resizable()
                .frame(width:200,height:200)
                .scaleEffect(scale)
                .foregroundColor(colorChoices[userSettings.selectedProfile.colorIndex].accent)
            
            Text("Plastic Tracker")
                .font(.largeTitle)
                .foregroundColor(colorChoices[userSettings.selectedProfile.colorIndex].primary)
            
            Text("")
            Text("See how my actions affect plastic pollution in our world!")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30.0)
                .foregroundColor(colorChoices[userSettings.selectedProfile.colorIndex].secondary)
            
            Spacer()
            
            Button(action: {
                animateBottle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    userSettings.selectedProfile.showStart = false
                }
                
            }) {
                
                
                Text("Start")
                    //.frame(width: 300.0, height: 75)
                    .background(colorChoices[userSettings.selectedProfile.colorIndex].primary)
                    .font(.largeTitle)
                    .padding(.horizontal, 100.0)
                    .padding(.vertical)
                }
            .background(RoundedRectangle(cornerRadius: 10   , style: .continuous))
            


            Spacer()
            
            }
            .padding(20)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserSettings())
    }
}
