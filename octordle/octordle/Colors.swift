//
//  Colors.swift
//  octordle
//
//  Created by Lasya Kambhampati on 6/23/23.
//

import SwiftUI

extension Color{
    static var wrong: Color {
        Color(UIColor(named: "wrong")!)
    }
    static var correct: Color {
        Color(UIColor(named: "correct")!)
    }
    static var undecided: Color {
        Color(UIColor(named: "undecided")!)
    }
    static var systemBackground: Color {
        Color(.systemBackground)
    }
}
