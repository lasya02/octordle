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
        ZStack {
            NavigationView {
                VStack{
                    Spacer()
                    VStack(spacing: 3){
                        ForEach(0...5, id: \.self) { index in
                            GuessView(guess: $dataModel.guesses[index])
                                .modifier(Shake(animatableData: CGFloat(dataModel.incorrectAttempts[index])))
                        }
                       
                    }
                    .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5 )
                    Spacer()
                    keyboardView()
                        .scaleEffect(Global.keyboardScale)
                        .padding(.top)
                    Spacer()
                }
                .disabled(dataModel.showStats)
                    .navigationBarTitleDisplayMode(.inline)
                    .disabled(dataModel.showStats)
                    .overlay(alignment: .top) {
                        if let toastText = dataModel.toastText {
                            toastView(toastText: toastText)
                                .offset(y: 20)
                        }
                    }
                    .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        HStack{
                            if !dataModel.inPlay {
                                Button{
                                    dataModel.newGame()
                                }label:{
                                    Text("New Game")
                                        .foregroundColor(.primary)
                                }
                            }
                            
                            
                            Button{
                                
                            }label: {
                                Image(systemName: "questionmark.circle")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("OCTORDLE")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.blue)
                            .minimumScaleFactor(0.5)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack{
                            Button {
                                withAnimation{
                                    dataModel.showStats.toggle()
                                }
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
            if dataModel.showStats{
                StatsView()
            }
       
        }
        .navigationViewStyle(.stack)
        
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataModel())
    }
}
