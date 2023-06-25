//
//  DataModel.swift
//  octordle
//
//  Created by Lasya Kambhampati on 6/23/23.
//

import SwiftUI

class DataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    
    init(){
        newGame()
    }
    
    func newGame(){
        populate()
    }
    
    func populate(){
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
    }
    
}
