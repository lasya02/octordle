//
//  DataModel.swift
//  octordle
//
//  Created by Lasya Kambhampati on 6/23/23.
//

import SwiftUI

class DataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    @Published var toastText: String?
    @Published var showStats = false
    
    var keyColors = [String : Color ]()
    var matchedLetters = [String] ()
    var misplacedLetters = [String] ()
    var toastWords = ["6/6", "5/6", "4/6","3/6","2/6","1/6"]
    var currentStat: Stats
    
    var selectedWord = ""
    var currentGuess = ""
    var attemptNumber = 0
    var inPlay = false
    var gameOver = false
    
    var gameStarted: Bool  {
        !currentGuess.isEmpty || attemptNumber > 0
    }
    
    var disableKeyboard: Bool {
        !inPlay || currentGuess.count == 5 
    }
    
    init(){
        currentStat = Stats.loadStat()
        newGame()
    }
    
    func newGame(){
        populate()
        selectedWord = Global.possibleWords.randomElement()!
        currentGuess = ""
        inPlay = true
        gameOver = false
        attemptNumber = 0
        print(selectedWord)
    }
    
    func populate(){
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters{
            keyColors[String(char)] = .gray
        }
        matchedLetters = []
        misplacedLetters = []
                
    }
    
    func addToCurrentWord(_ letter: String){
        currentGuess += letter
        updateRow()
        
        
    }
    func enterWord(){
        if currentGuess == selectedWord{
            gameOver = true
            print("You won")
            setGuessColors()
            currentStat.update(win: true, index: attemptNumber)
            showToast(with: toastWords[attemptNumber])
            inPlay = false
        }
        else{
            if verifyWord() {
                print("real word")
                setGuessColors()
                attemptNumber += 1
                currentGuess = ""
                if attemptNumber == 6 {
                    currentStat.update(win: false)
                    gameOver = true
                    inPlay = false
                    showToast(with: selectedWord)
                }
                
            }
            else {
                withAnimation {
                    incorrectAttempts[attemptNumber] += 1
                }
                showToast(with: "Not in word list")
                incorrectAttempts[attemptNumber] = 0
            }
        }
        
        
    }
    func removeLetter(){
        currentGuess.removeLast()
        updateRow()
        
    }
    
    func updateRow(){
        let guessWord = currentGuess.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[attemptNumber].word = guessWord
    }
    
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentGuess)
    }
    
    func setGuessColors() {
        let correctLetters = selectedWord.map { String($0) }
        var frequency = [String : Int]()
        for letter in correctLetters {
            frequency[letter, default: 0] += 1
        }
        for index in 0...4 {
            let correctLetter = correctLetters[index]
            let guessLetter = guesses[attemptNumber].guessLetters[index]
            if guessLetter == correctLetter {
                guesses[attemptNumber].background[index] = .correct
                if !matchedLetters.contains(guessLetter) {
                    matchedLetters.append(guessLetter)
                    keyColors[guessLetter] = .correct
                }
                if misplacedLetters.contains(guessLetter) {
                    if let index = misplacedLetters.firstIndex(where: {$0 == guessLetter}) {
                        misplacedLetters.remove(at: index)
                    }
                }
                frequency[guessLetter]! -= 1
            }
        }
        
        for index in 0...4 {
            let guessLetter = guesses[attemptNumber].guessLetters[index]
            if correctLetters.contains(guessLetter)
                && guesses[attemptNumber].background[index] != .correct
                && frequency[guessLetter]! > 0 {
                guesses[attemptNumber].background[index] = .misplaced
                if !misplacedLetters.contains(guessLetter) && !matchedLetters.contains(guessLetter) {
                    misplacedLetters.append(guessLetter)
                    keyColors[guessLetter] = .misplaced
                }
                frequency[guessLetter]! -= 1
            }
        }
        
        for index in 0...4 {
            let guessLetter = guesses[attemptNumber].guessLetters[index]
            if keyColors[guessLetter] != .correct
                && keyColors[guessLetter] != .misplaced {
                keyColors[guessLetter] = .wrong
            }
        }
        flipCards(for: attemptNumber)
    }

    
    
    func flipCards( for row: Int){
        for col in 0...4{
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(col) * 0.2){
                self.guesses[row].cardFlipped[col].toggle()
            }
        }
    }
    
    func showToast(with text: String?) {
        withAnimation {
            toastText = text
        }
        withAnimation(Animation.linear(duration: 0.2).delay(3)) {
            toastText = nil
            if gameOver {
                withAnimation(Animation.linear(duration: 0.2).delay(3)) {
                    showStats.toggle()
                }
            }
        }
    }
    
}

