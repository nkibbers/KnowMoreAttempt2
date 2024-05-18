//
//  LeaderboardView.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 18/5/2024.
//

import SwiftUI

struct leaderboard: View {
    @ObservedObject var highScoreViewManager: HighScoreViewModel
    
    let backgroundImages = ["purplebg", "yellowbg", "lightbluebg", "greenbg", "orangebg", "brownbg", "tangerinebg"]
    let fontImages = ["greenbg", "orangebg", "tangerinebg", "lightbluebg", "brownbg", "purplebg", "yellowbg"]
    
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
                            ForEach(Array(zip(highScoreViewManager.playerScores.sorted { $0.score > $1.score }, 0...6)), id: \.0.id) { player, index in
//                                let rank = index + 1
                                ZStack (alignment: .leading) {
                                    Image(backgroundImages[index])
                                        .resizable()
                                        .frame(width: .infinity, height: 100)
                                    HStack (alignment: .top) {
                                        Image(fontImages[index])
                                            .resizable()
                                            .frame(width: 190, height: 40) // Adjust width to fit rank and player name
                                            .mask(
                                                Text(player.name)
                                                    .font(Font.custom("Louis George Cafe Bold", size: 33))
                                                    .foregroundColor(.white)
                                                    .kerning(-1)
                                            )
                                        Image(fontImages[0])
                                            .resizable()
                                            .frame(width: 190, height: 40) // Adjust width to fit rank and player name
                                            .mask(
                                                Text("\(player.score)")
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
    
    func questionColors() -> [String] {
        let numberOfColors = backgroundImages.count
        return Array(repeating: backgroundImages, count: numberOfColors).flatMap { $0 }
    }
}

#Preview {leaderboard(highScoreViewManager: HighScoreViewModel())}
