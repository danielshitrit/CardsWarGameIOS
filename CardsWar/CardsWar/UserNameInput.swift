//
//  UserNameInput.swift
//  CardsWar
//
//  Created by Danielle Shitrit on 14/07/2024.
//

import SwiftUI

struct UserNameInput: View {
    @ObservedObject var viewModel: MainViewModel
    @State private var userName: String = ""

    var body: some View {
        VStack {
            Text("Insert name")
                .font(.largeTitle)
                .padding()

            TextField("Your name", text: $userName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)

            Button(action: {
                // Update the view model's property directly
                viewModel.name = userName
                viewModel.isLinkActive = true // Assuming this is what triggers the navigation
            }) {
                Text("START")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
}

struct UserNameInput_Previews: PreviewProvider {
    static var previews: some View {
        UserNameInput(viewModel: MainViewModel())
    }
}
