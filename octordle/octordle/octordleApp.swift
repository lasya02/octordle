//
//  octordleApp.swift
//  octordle
//
//  Created by Lasya Kambhampati on 6/21/23.
//

import SwiftUI

@main
struct octordleApp: App {
    @StateObject var dataModel = DataModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
        }
    }
}
