//
//  Letters.swift
//  octordle
//
//  Created by Lasya Kambhampati on 6/25/23.
//

import SwiftUI

struct Letters: View {
    @EnvironmentObject var dataModel: DataModel
    var letter: String
    
    var body: some View {
        Button {
            dataModel.addToCurrentWord(letter)
        } label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(dataModel.keyColors[letter])
                .foregroundColor(.primary)
                
        }
        .buttonStyle(.plain)

       
    }
}

struct Letters_Previews: PreviewProvider {
    static var previews: some View {
        Letters(letter: "L")
            .environmentObject(DataModel())
    }
}
