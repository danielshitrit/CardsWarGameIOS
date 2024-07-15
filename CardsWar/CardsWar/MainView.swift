//
//  MainView.swift
//  CardsWar
//
//  Created by Danielle Shitrit on 14/07/2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var locationManager: LocationManager
    @StateObject var viewModel = MainViewModel()
   
    var body: some View {
        ZStack {
            Color.white
            
            if !viewModel.isLinkActive {
                UserNameInput(viewModel: viewModel)
            } else {
                EarthMark(viewModel: viewModel).environmentObject(locationManager)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(LocationManager())
    }
}
