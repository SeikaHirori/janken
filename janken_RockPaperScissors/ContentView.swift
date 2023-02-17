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
    @State private var shouldPlayerWin: Bool = Bool.random() // CS #2 & CS #3
    
    @State private var currentRound: Int = 1
    
    @State private var score_player_victories_count:Int = 0
    @State private var previousScore:String = "" // Track score for debugging purposes
    
    var body: some View {
        VStack {
            Text("Round: \(currentRound)")
                .roundTitleCount()
            Text(previousScore)
            Text("Score: \(score_player_victories_count)")

            listRPS
            
            Button("\(switchToLang)") {
                useEnglish.toggle()
                switchLanguage()
            }
            .settings_style()
            
            
            
            
            Text("debug | bot chose: \(app_RPS_choice)")
            
            
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
                } label: {
                    Text("\(itemValue)")
                }
                .buttonRPS_style()
            }
        }
    }
    
    func switchLanguage() -> () {
        let englishRPS:[String] = ["Rock", "Paper", "Scissor"]
        let japaneseRPS:[String] = ["グー (guu)","パー (paa)" ,"チョキ (choki)"]
        
        let template_switchTo:String = "Switch to:\n"
        let string_switchToEnglish:String = template_switchTo + "English"
        let string_switchToJapanese:String = template_switchTo + "Japanese"
        
        
        
        switchToLang = useEnglish ? string_switchToJapanese : string_switchToEnglish
        currentLanguage = useEnglish ? englishRPS : japaneseRPS
//
//        if useEnglish {
//            currentLanguage = englishRPS
//        } else {
//            currentLanguage = japaneseRPS
//        }
    }
    
    func playerSelectChoice_fightTime(_ choice:rockPaperScissors) {
        print("Choice #\(choice): \(currentLanguage[choice.rawValue])")
        
        let rpsRawValue = choice.rawValue
        
        // Handle draw here
        if rpsRawValue == app_RPS_choice {
            
        }
        
        switch rpsRawValue {
        // Rock
        case 0:
            if app_RPS_choice == 2 {
                victoryMeansPlusOneToScore()
            }
        // Paper
        case 1:
            if app_RPS_choice == 0 {
                victoryMeansPlusOneToScore()
            }
        // Scissors
        case 2:
            if app_RPS_choice == 1 {
                victoryMeansPlusOneToScore()
            }
            
        default:
            break
        }
        
        nextRound()
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
