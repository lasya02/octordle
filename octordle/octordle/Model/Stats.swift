//
//  Stats.swift
//  octordle
//
//  Created by Lasya Kambhampati on 7/11/23.
//

import Foundation

struct Stats: Codable{
    var frequencies = [Int](repeating: 0, count: 6)
    var games = 0
    var streak = 0
    var maxStreak = 0
    
    var wins: Int {
        frequencies.reduce(0, +)
    }
    
    func saveStat(){
        if let encoded = try? JSONEncoder().encode(self){
            UserDefaults.standard.set(encoded,forKey: "Stat")
        }
    }
    
    static func loadStat() -> Stats {
        if let savedStat = UserDefaults.standard.object(forKey: "Stat") as? Data{
            if let currentStat = try? JSONDecoder().decode(Stats.self, from: savedStat){
                return currentStat
            }
            else{
                return Stats()
            }
        }else {
            return Stats()
        }
            
    }
    
    mutating func update(win: Bool, index: Int? = nil){
        games += 1
        streak = win ? streak + 1 : 0
        if win {
            frequencies[index!] += 1
            maxStreak = max(maxStreak, streak)
        }
        saveStat()
    }
}
