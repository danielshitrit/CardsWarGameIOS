//
//  MainViewModel.swift
//  CardsWar
//
//  Created by Danielle Shitrit on 14/07/2024.
//

import Foundation

class MainViewModel: ObservableObject{
    @Published var constLongitude = 34.817549168324334
    
    @Published var name : String = ""
    @Published var title : String = "Welcome To Cards War Game"
    @Published var errorMessage = ""
    @Published var isLinkActive = false
    @Published var showLocation = false
    @Published var isWest = false
    @Published var isReadyToPlay = false
    
    init(){
        
    }
    
    func setName(){
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please Enter  User Name: "
            return
        }
        title = "Hi " + name
    
        isLinkActive = true
    }
    
    func checkLandMarks(latitude: Double, longitude: Double){
        print(latitude, longitude)
        if longitude < constLongitude{
            isWest = true
        }else{
            isWest = false
        }
        showLocation = true
    }
    
    func startPlay(){
        isReadyToPlay = true
    }
}
