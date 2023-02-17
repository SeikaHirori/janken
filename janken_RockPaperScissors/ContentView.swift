//
//  ContentView.swift
//  janken_RockPaperScissors
//
//  Created by Seika Hirori on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentLanguage:[String] = ["グー (guu)","パー (paa)" ,"チョキ　(choki)"] // Default to Japanese on launch
    @State private var useEnglish:Bool = false
    
    @State private var app_RPS_choice: Int = Int.random(in: 0...2) // CS #2
    @State private var shouldPlayerWin: Bool = Bool.random() // CS #2
    
    @State private var currentRound: Int = 1
    
    var body: some View {
        VStack {
            Text("Round: \(currentRound)")
                .roundTitleCount()
            listRPS
        }
    }
    
    // CS #1
    var listRPS: some View {
        VStack {
            ForEach(rockPaperScissors.allCases, id: \.self) {
                let itemValue:String = "\(currentLanguage[$0.rawValue])"
                let rpsValue:Int = $0.rawValue
//                Text("DEBUG #\($0.rawValue): \(itemValue)")
//                    .padding()
                
                Button {
                    playerSelectChoice_fightTime(rpsValue)
                } label: {
                    Text("\(itemValue)")
                }
                .buttonRPS_style()
                
            }
        }
    }
    
    func switchLanguage() -> () {
        let englishRPS:[String] = ["Rock", "Paper", "Scissor"]
        let japaneseRPS:[String] = ["グー (guu)","パー (paa)" ,"チョキ　(choki)"]
        
        if useEnglish {
            currentLanguage = englishRPS
        } else {
            currentLanguage = japaneseRPS
        }
    }
    
    func playerSelectChoice_fightTime(_ choice:Int) {
        print("Choice #\(choice): \(currentLanguage[choice])")
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
            .frame(maxWidth: 150, maxHeight: 75)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
    }
}
