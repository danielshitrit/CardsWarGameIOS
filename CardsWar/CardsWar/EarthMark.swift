//
//  EarthMark.swift
//  CardsWar
//
//  Created by Danielle Shitrit on 14/07/2024.
//


import SwiftUI

struct EarthMark: View {
    @EnvironmentObject var locationManager : LocationManager
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack{
            NavigationStack{
                VStack (alignment: .center){
                    //Header
                    Text(viewModel.title)
                        .font(.system(size: 45))
                        .foregroundColor(Color.black)
                        .bold()
                        .padding(.bottom, 10)
                        .onAppear{
                            viewModel.checkLandMarks(latitude: (locationManager.location?.coordinate.latitude ?? 0.0), longitude: (locationManager.location?.coordinate.longitude ?? 0.0))
                        }
                    
                    //Location + Image
                    if viewModel.showLocation{
                        
                        //fix that
                        Text("Your Exact Location: [\(locationManager.location?.coordinate.latitude ?? 0.0), \(locationManager.location?.coordinate.longitude ?? 0.0)]")
                            .frame(maxWidth: .infinity)
                        
                        HStack{
                            if viewModel.isWest{
                                Image("West")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
                                    .alignmentGuide(.leading) { _ in
                                        0 // Aligns the image to the right within its container
                                    }
                                Spacer()
                            }else{
                                Spacer()
                                Image("East")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
                                    .alignmentGuide(.trailing) { _ in
                                        0 // Aligns the image to the right within its container
                                    }
                            }
                        }
                    }
                    
                    //Button
                    Button {
                        viewModel.startPlay()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                                .frame(width: 150, height: 50)
                            Text("START")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }.padding()
                    
                    NavigationLink(
                        destination: GameView(isWest: viewModel.isWest, name: viewModel.name),
                        isActive: $viewModel.isReadyToPlay,
                        label: {
                            EmptyView()
                        }
                    )
                    .hidden()

                    
                }.padding()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
            }
        }
    }
}

struct EarthMark_Previews: PreviewProvider {
    static var previews: some View {
        EarthMark(viewModel: MainViewModel())
    }
}
