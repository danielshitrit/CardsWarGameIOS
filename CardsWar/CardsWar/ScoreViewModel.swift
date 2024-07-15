//
//  ScoreViewModel.swift
//  CardsWar
//
//  Created by Danielle Shitrit on 14/07/2024.
//

import Foundation


class ScoreViewModel: ObservableObject{
    @Published var winnerTitle : String = ""
    @Published var scoreTitle : String = ""
    @Published var isBack = false

    init(winnerName: String, score: Int)
    {
        winnerTitle = "Winner: " + winnerName
        scoreTitle = "score: \(score)"
    }
    
    func backTomMenu(){
        isBack = true
    }

}
