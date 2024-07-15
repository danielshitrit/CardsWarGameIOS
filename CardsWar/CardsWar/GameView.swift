//
//  GameView.swift
//  CardsWar
//
//  Created by Danielle Shitrit on 14/07/2024.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: GameViewModel
    
    init(isWest: Bool, name: String) {
        _viewModel = StateObject(wrappedValue: GameViewModel(isWest: isWest, playerName: name))
    }

    
    var body: some View {
    NavigationStack{
        ZStack {
            Image("background-Cards")
                .resizable()
                .ignoresSafeArea()
                
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    if viewModel.isPlayerWest {
                        VStack {
                            Text(viewModel.self.playerName)
                                .bold()
                                .foregroundColor(Color.white)
                                .font(.title)
                                .padding(.bottom, 2)
                                
                            Text("\(viewModel.playerScore)")
                                .font(.largeTitle)
                        }
                        .alignmentGuide(.leading) { _ in
                            0
                        }
                        Spacer()
                        
                        
                        VStack {
                            Text("PC")
                                .bold()
                                .foregroundColor(Color.white)
                                .font(.title)
                                .padding(.bottom, 2)
                            Text("\(viewModel.houseScore)")
                                .font(.largeTitle)
                        }
                        .alignmentGuide(.leading) { _ in
                            0
                        }
                        Spacer()
                    } else {
                        VStack {
                            Text("PC")
                                .bold()
                                .foregroundColor(Color.white)
                                .font(.title)
                                .padding(.bottom, 2)
                            Text("\(viewModel.houseScore)")
                                .font(.largeTitle)
                        }
                        .alignmentGuide(.leading) { _ in
                            0
                        }
                        Spacer()
                    }
                }
                .foregroundColor(.white)
                
                HStack {
                    Spacer()
                    
                    Image(viewModel.playerCard.image)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "timer")
                            .resizable()
                            .frame(width: 80, height: 80)
                        Text("\(viewModel.gameCount)")
                            .font(.largeTitle)
                            .italic()
                            .bold()
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(viewModel.houseCard.image)
                    
                    Spacer()
                }
                
                Spacer()
            }
            NavigationLink(
                destination: ScoreView(winner: viewModel.winner, score: viewModel.winnerScore),
                isActive: $viewModel.isGameOver,
                label: { EmptyView() }
            )
            .hidden()

        }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(isWest: true, name: "Danielle;")
    }
}
