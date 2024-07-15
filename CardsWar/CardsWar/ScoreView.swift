//
//  ScoreView.swift
//  CardsWar
//
//  Created by Danielle Shitrit on 14/07/2024.
//


import SwiftUI

struct ScoreView: View {
    @StateObject private var viewModel: ScoreViewModel
    let winner: String // Add this property
    
    @State private var isWinnerAnimating = false // Add state for animation

    init(winner: String, score: Int) {
        self.winner = winner // Initialize the winner property
        _viewModel = StateObject(wrappedValue: ScoreViewModel(winnerName: winner, score: score))
    }

    
    var body: some View {
        NavigationStack{
            VStack{
                VStack {
                    //Header
                    Text(viewModel.winnerTitle)
                        .font(.system(size: 30))
                        .foregroundColor(isWinnerAnimating ? .black : .blue) // Change color based on animation state
                                                .bold()
                                                .scaleEffect(isWinnerAnimating ? 1.2 : 1.0) // Apply scale effect based on animation state
                                                .animation(.spring()) // Apply animation
                    
                    Spacer()
                    
                    Text(viewModel.scoreTitle)
                        .bold()
                        .font(.system(size: 30))
                        .foregroundColor(Color.black)
                     
                    Spacer()
                    
                    Button {
                        viewModel.backTomMenu()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                                .frame(width: 160, height: 60)
                            Text("BACK TO MEMU")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }.padding()
                    
                }.padding(.top, 30)
            }
                NavigationLink(destination: EarthMark(viewModel: MainViewModel()),isActive: $viewModel.isBack){}.hidden()
            }
        .onAppear {
                    withAnimation {
                        isWinnerAnimating = true // Trigger the animation on view appear
                    }
                }
        }
    }
    
    
    struct ScoreView_Previews: PreviewProvider {
        static var previews: some View {
            ScoreView(winner: "Danielle" , score: 12)
        }
    }

