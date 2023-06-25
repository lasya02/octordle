//
//  Guess.swift
//  octordle
//
//  Created by Lasya Kambhampati on 6/23/23.
//

import SwiftUI

struct Guess {
    let index: Int
    let word = "     "
    var background = [Color](repeating: .gray, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map { String($0) }
    }
    
}

