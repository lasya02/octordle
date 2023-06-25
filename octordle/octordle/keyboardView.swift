//
//  keyboardView.swift
//  octordle
//
//  Created by Lasya Kambhampati on 6/25/23.
//

import SwiftUI

struct keyboardView: View {
    @EnvironmentObject var dataModel: DataModel
    var topKeyboard = "QWERTYUIOP".map{String($0)}
    var middleKeyboard = "ASDFGHJKL".map{String($0)}
    var bottomKeyboard = "ZXCVBNM".map{String($0)}
    
    var body: some View {
        VStack{
            HStack(spacing: 2){
                ForEach(topKeyboard, id: \.self) { letter in
                    Letters(letter: letter)
                }
            }
            HStack(spacing: 2){
                ForEach(middleKeyboard, id: \.self) { letter in
                    Letters(letter: letter)
                }
                
            }
            HStack(spacing: 2){
                Button {
                    dataModel.enterWord()
                } label: {
                    Text("Enter")
                }
                .font(.system(size: 20))
                .frame(width: 60, height: 50)
                .background(Color.gray)
                .foregroundColor(.primary)

                ForEach(bottomKeyboard, id: \.self) { letter in
                    Letters(letter: letter)
                }
                Button {
                    dataModel.removeLetter()
                } label: {
                    Image(systemName: "delete.backward.fill")
                }
                .font(.system(size: 20, weight: .heavy))
                .frame(width: 40, height: 50)
                .background(Color.gray)
                .foregroundColor(.primary)
            }
        }
    }
    
}

struct keyboardView_Previews: PreviewProvider {
    static var previews: some View {
        keyboardView()
            .environmentObject(DataModel())
            .scaleEffect(Global.keyboardScale)
    }
}

