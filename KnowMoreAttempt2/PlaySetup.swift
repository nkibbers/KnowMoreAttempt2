//
//  PlaySetup.swift
//  KnowMore
//
//  Created by Nadia Kiblisky on 5/10/24.
//

import SwiftUI

struct PlaySetup: View {
    @Binding var name: String
    @Binding var isPlayButtonPressed: Bool
    @Binding var selectedDifficulty: Int

    var body: some View {
        ZStack {
            Image("yellowbg")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("orangebg")
                    .resizable()
                    .frame(width: 400, height: 100)
                    .mask(
                        Text("play")
                            .font(Font.custom("Mont-HeavyDEMO", size: 90))
                            .foregroundColor(.white)
                            .kerning(-1)
                            .position(x: 120, y: 50)
                    )
                TextField("Enter your player name", text: $name)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Image("orangebg")
                            .resizable()
                            .scaledToFill()
                            .mask(
                                RoundedRectangle(cornerRadius: 0)
                                    .frame(width:.infinity, height: 80))
                            )
                    .padding(.top, 80)
                    .padding(.bottom, 50.0)

                Text("Difficulty:")
                Picker(selection: $selectedDifficulty, label: Text("Difficulty"))
                {
                    Text("Easy").tag(1)
                    Text("Medium").tag(2)
                    Text("Difficult").tag(3)
                }
                Button("Start Game") {
                    isPlayButtonPressed = false
                }
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                .padding(20)
            }
        }
    }
}

struct PlaySetup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySetup(name: .constant("Player Name"), isPlayButtonPressed: .constant(false), selectedDifficulty: .constant(1))
    }
}
