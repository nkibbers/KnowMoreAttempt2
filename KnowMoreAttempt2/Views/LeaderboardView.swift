//
//  LeaderboardView.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 18/5/2024.
//

import SwiftUI

struct leaderboard: View {
    
    let backgroundImages = ["purplebg", "yellowbg", "lightbluebg", "greenbg", "orangebg", "brownbg", "tangerinebg"]
    let fontImages = ["greenbg", "orangebg", "tangerinebg", "lightbluebg", "brownbg", "purplebg", "yellowbg"]
    let players = ["player1", "player2", "player3", "player4", "player5", "player6", "player7"]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("whitebg")
                    .resizable()
                    .ignoresSafeArea()
                VStack (alignment: .leading) {
                    Image("blackbg")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .mask(VStack(spacing: -40) {
                            Text("leaderboard")
                                .font(Font.custom("Mont-HeavyDEMO", size: 85))
                                .kerning(-1)
                        }
                        )
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 1), spacing: 0) {
                            ForEach(players.indices, id: \.self) { index in
                                let rank = index + 1
                                ZStack (alignment: .leading) {
                                    Image(backgroundImages[index])
                                        .resizable()
                                        .frame(width: .infinity, height: 100)
                                    HStack (alignment: .top) {
                                        Image(fontImages[index])
                                            .resizable()
                                            .frame(width: 50, height: 40)
                                            .mask(
                                        Text("\(rank)")
                                            .font(Font.custom("Louis George Cafe Bold", size: 33))
                                            .kerning(-1)
                                            .padding(.leading, 10)
                                        )
                                        Image(fontImages[index])
                                            .resizable()
                                            .frame(width: 190, height: 40) // Adjust width to fit rank and player name
                                            .mask(
                                                Text(players[index])
                                                    .font(Font.custom("Louis George Cafe Bold", size: 33))
                                                    .foregroundColor(.white)
                                                    .kerning(-1)
                                            )
                                    }
                                
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("KMBlack"))
                }
            )
        }
    }
}

#Preview {leaderboard()}
