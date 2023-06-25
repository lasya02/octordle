//
//  DataModel.swift
//  octordle
//
//  Created by Lasya Kambhampati on 6/23/23.
//

import SwiftUI

class DataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    
    var keyColors = [String : Color ]()
    
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
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters{
            keyColors[String(char)] = .gray
        }
            
                
    }
    
    func addToCurrentWord(_ letter: String){
        
        
    }
    func enterWord(){
        
    }
    func removeLetter(){
        
    }
    
}

