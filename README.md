# Janken「じゃんけんぽん」| Rock, Papers, Scissors

***House Keeping***

Project specifications:
- https://www.hackingwithswift.com/guide/ios-swiftui/2/3/challenge

Index for Checklist:
- [ ] = TO-DO
- [x] = COMPLETED
___

**User Story**
- this is provided by specifications

- 1. Each turn of the game the app will randomly pick either rock, paper, or scissors.
- 2. Each turn the app will alternate between prompting the player to win or lose.
- 3. The player must then tap the correct move to win or lose the game.
- 4. If they are correct they score a point; otherwise they lose a point.
- 5. The game ends after 10 questions, at which point their score is shown.

- If the app chose “Rock” and “Win” the player would need to choose “Paper”, but if the app chose “Rock” and “Lose” the player would need to choose “Scissors”.
___
**Checklist | Challenge Specifications (CS)**

- [x] 1. Start with an App template, then create a property to store the three possible moves: rock, paper, and scissors.
- [x] 2. You’ll need to create two @State properties to store the app’s current choice and whether the player should win or lose.
- [x] 3. You can use Int.random(in:) to select a random move. You can use it for whether the player should win too if you want, but there’s an even easier choice: Bool.random() is randomly true or false. After the initial value, use toggle() between rounds so it’s always changing.
- [ ] 4. Create a VStack showing the player’s score, the app’s move, and whether the player should win or lose. You can use if shouldWin to return one of two different text views.
- [x] 5. The important part is making three buttons that respond to the player’s move: Rock, Paper, or Scissors.
- [ ] 6. Use the font() modifier to adjust the size of your text. If you’re using emoji for the three moves, they also scale. Tip: You can ask for very large system fonts using .font(.system(size: 200)) – they’ll be a fixed size, but at least you can make sure they are nice and big!

___
**Checklist | Personal Specifications (PS)**
Have the language options either be in Japanese or English!
    - This comes through as a toggle.
    - Info on Janken and eng-japanese translation:
        - https://www.tofugu.com/japan/janken/

- [ ] Create two enums for English and Japanese versions of rock, paper, scissor
- [ ] Create toggle button that switches between English and Japanese
    - This might need a separate enum for English and Japanese?
    - Maybe use tenary operation if it works?
        - Possibly, use @State and a bool to switch between languages
            - Limitations: This only works for two languages. A different work around would be needed when three or more languages are options.
    - Placement to be determined(TBD). Possible placement: top-right(top trailing)?