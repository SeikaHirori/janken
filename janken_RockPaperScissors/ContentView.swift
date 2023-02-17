//
//  ContentView.swift
//  janken_RockPaperScissors
//
//  Created by Seika Hirori on 2/16/23.
//

import SwiftUI

struct ContentView: View {

    @State private var currentLanguage:[String] = ["グー (guu)","パー (paa)" ,"チョキ (choki)"] // Default to Japanese on launch
    
    @State private var switchToLang: String = "Switch to:\nEnglish"
    @State private var useEnglish:Bool = false
    
    @State private var app_RPS_choice: Int = Int.random(in: 0...2) // CS #2
    @State private var should_Player_Win: Bool = Bool.random() // CS #2 & CS #3
    
    @State private var currentRound: Int = 1
    
    @State private var score_player_victories_count:Int = 0
    @State private var previousScore: String = "Previous score: NA (this is 1st round)" // Track score for debugging purposes
    @State private var resultFromLastRound:String = """
Result:
new round :3
"""
    
    var body: some View {
        VStack {
            
            headsUpDisplay
            listRPS
            
            Button("\(switchToLang)") {
                useEnglish.toggle()
                switchLanguage()
            }
            .settings_style()
            Text(resultFromLastRound)
                .multilineTextAlignment(.center)
                .appSelected_style()
            debugInformation
        }
    }
    
    // CS #1
    var listRPS: some View {
        VStack {
            ForEach(rockPaperScissors.allCases, id: \.self) { optionRPS in
                let itemValue:String = "\(currentLanguage[optionRPS.rawValue])"
                let currentChoice: rockPaperScissors = optionRPS
//                Text("DEBUG #\($0.rawValue): \(itemValue)")
//                    .padding()
                
                Button {
                    playerSelectChoice_fightTime(currentChoice)
                    nextRound()
                } label: {
                    Text("\(itemValue)")
                }
                .buttonRPS_style()
            }
        }
    }
    
    // CS #4
    var headsUpDisplay: some View {

        VStack(spacing: 10) {
            let template_app_selected:String = "App selected: \n"
            let app_selected:String = currentLanguage[app_RPS_choice]
            let message_pick_the_option:String = template_app_selected + app_selected
            
            let win_or_lose:String = should_Player_Win ? "Win" : "Lose"
            let message_you_should_try_to:String = "You should try to:\n\(win_or_lose)"
            
            
            Text("Round: \(currentRound)")
                .roundTitleCount()
            Text("Score: \(score_player_victories_count)")
                .frame(maxWidth: 100, maxHeight: 50)
                .font(.title2)
                .background(Color(uiColor: .darkGray))
                .foregroundColor(.white)
            
            HStack(spacing: 20) {
                Text("\(message_pick_the_option)")
                    .appSelected_style()
                Text(message_you_should_try_to)
                    .multilineTextAlignment(.center)
                    .appSelected_style()
                
            }

           
            
        }
    }
    
    var debugInformation:some View {
        VStack {
            Text("debug | bot chose: \(app_RPS_choice)")
            Text(previousScore) // DEBUG ONLY
            
        }
    }
    
    // PS #1
    func switchLanguage() -> () {
        let englishRPS:[String] = ["Rock", "Paper", "Scissor"]
        let japaneseRPS:[String] = ["グー (guu)","パー (paa)" ,"チョキ (choki)"]
        
        let template_switchTo:String = "Switch to:\n"
        let string_switchToEnglish:String = template_switchTo + "English"
        let string_switchToJapanese:String = template_switchTo + "Japanese"
        
        
        
        switchToLang = useEnglish ? string_switchToJapanese : string_switchToEnglish
        currentLanguage = useEnglish ? englishRPS : japaneseRPS
    }
    
    func playerSelectChoice_fightTime(_ choice:rockPaperScissors) {
        print("Choice #\(choice): \(currentLanguage[choice.rawValue])")
        
        let rpsRawValue = choice.rawValue
        
        // Handle draw here
        if rpsRawValue == app_RPS_choice {
            
        }
        
        
        var didPlayerWin:Bool = false
        switch rpsRawValue {
        // Rock
        case 0:
            if app_RPS_choice == 2 {
                didPlayerWin = true
            }
        // Paper
        case 1:
            if app_RPS_choice == 0 {
                didPlayerWin = true
            }
        // Scissors
        case 2:
            if app_RPS_choice == 1 {
                didPlayerWin = true
            }
            
        default:
            break
        }
        
        let template_message_lastRound:String = "Last round:\n"
        if didPlayerWin == should_Player_Win {
            victoryMeansPlusOneToScore()
            resultFromLastRound = "\(template_message_lastRound):D"
        } else {
            resultFromLastRound = "\(template_message_lastRound)... :'["
        }
        
    }
    
    func victoryMeansPlusOneToScore() {
        score_player_victories_count += 1
    }
    
    func nextRound() {
        if currentRound == 10 {
            print("You finished all 10 rounds :3")
            print("Your score: \(score_player_victories_count)")
            previousScore = "Previous score: \(score_player_victories_count)"
            currentRound = 0
            score_player_victories_count = 0
        }
        
        app_RPS_choice = Int.random(in: 0...2) // CS #3
        should_Player_Win = Bool.random()
        
        currentRound += 1
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func roundTitleCount() -> some View {
        modifier(RoundTitleCount())
    }
    
    func buttonRPS_style() -> some View {
        modifier(ButtonRPSstyle())
    }
    
    func settings_style() -> some View {
        modifier(SettingsStyle())
    }
    
    func appSelected_style() -> some View {
        modifier(AppSelectedStyle())
    }
}

struct RoundTitleCount: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(50)
            .frame(maxWidth: 250, maxHeight: 50)
            .font(.title)
            .background(Color.indigo)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
    }
}

struct ButtonRPSstyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .frame(maxWidth: 200, maxHeight: 75)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .font(.system(size: 25))
            .clipShape(Capsule())
    }
}

struct SettingsStyle:ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(5)
            .frame(maxWidth: 100)
            .background(Color.red)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
    }
}

struct AppSelectedStyle: ViewModifier {
    func body(content:Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .frame(maxWidth: 160,maxHeight: 50)
            .background(Color.cyan)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
