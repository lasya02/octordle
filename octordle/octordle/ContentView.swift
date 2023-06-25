//
//  ContentView.swift
//  octordle
//
//  Created by Lasya Kambhampati on 6/21/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataModel: DataModel
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                VStack(spacing: 3){
                    GuessView(guess: $dataModel.guesses[0])
                    GuessView(guess: $dataModel.guesses[1])
                    GuessView(guess: $dataModel.guesses[2])
                    GuessView(guess: $dataModel.guesses[3])
                    GuessView(guess: $dataModel.guesses[4])
                    GuessView(guess: $dataModel.guesses[5])
                }
                .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5 )
                Spacer()
                keyboardView()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        
                    }label: {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(.blue)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("OCTORDLE")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "chart.bar")
                                .foregroundColor(.blue)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    
                    
                }
            }
            
        }
        .navigationTitle("Octordle")
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataModel())
    }
}
