//
//  HomeView.swift
//  
//
//  Created by Nadia Kiblisky on 5/4/24.
//

import SwiftUI

struct WelcomeScreen: View {
    @ObservedObject var quizzoManager =  QuizzoManager()
    @AppStorage("playerName") private var playerName = ""
    @ObservedObject var highScoreViewManager: HighScoreViewModel
    
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
                        .mask {
                            Text("know more")
                                .font(Font.custom("Mont-HeavyDEMO", size: 85))
                                .foregroundColor(.white)
                                .kerning(-1)
                        }
                        .padding(.top, 50)
                    
                    VStack {
                        TextField("Enter your name here", text: $playerName)
                            .frame(maxWidth: .infinity, maxHeight: 80)
                            .foregroundColor(Color("KMBlack"))
                            .font(Font.custom("Louis George Cafe Bold", size: 20))
                            .padding(.horizontal, 20)
                            .background(
                                Image("lightbluebg")
                                    .resizable()
                                    .scaledToFill()
                                    .mask(
                                        RoundedRectangle(cornerRadius: 0)
                                            .frame(width:.infinity, height: 80))
                            )
                            .padding(.bottom, 20)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 2), spacing: 0) {
                            
                            NavigationLink(
                                destination: leaderboard(highScoreViewManager: HighScoreViewModel())
                                    .navigationBarBackButtonHidden(true)
                            )
                            {
                                ZStack {
                                    Image("purplebg")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                    Image("greenbg")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                        .mask(
                                            Text("leader board")
                                                .font(Font.custom("Mont-HeavyDEMO", size: 40))
                                                .foregroundColor(.white)
                                                .kerning(-1)
                                        )
                                }
                            }
                            
                            NavigationLink {
                                ResultScreen()
                                    .environmentObject(quizzoManager)
                            } label: {
                                ZStack{
                                    Image("yellowbg")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                    
                                    Image("orangebg")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                        .mask(
                                            Text("play")
                                                .font(Font.custom("Mont-HeavyDEMO", size: 45))
                                                .foregroundColor(.white)
                                                .kerning(-1)
                                        )
                                }
                                
                            }
                            
                            NavigationLink(
                                destination: TriviaArchiveView(quizzoManager: quizzoManager)
                                    .navigationBarBackButtonHidden(true)
                            )
                            {

                                ZStack{
                                    Image("lightbluebg")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                    
                                    Image("tangerinebg")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                        .mask(
                                            Text("archive")
                                                .font(Font.custom("Mont-HeavyDEMO", size: 45))
                                                .foregroundColor(.white)
                                                .kerning(-1)
                                        )
                                }
                                
                            }
                            
                            ZStack {
                                Image("greenbg")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                ZStack {
                                    Image("purplebg")
                                        .resizable()
                                        .frame(width: 200, height: 40)
                                        .mask(
                                            Text("high score")
                                                .font(Font.custom("Mont-HeavyDEMO", size: 38))
                                                .foregroundColor(.white)
                                                .kerning(-1)
                                        )
                                    
                                    Image("purplebg")
                                        .resizable()
                                        .frame(width: 200, height: 40)
                                        .mask(
                                            Text("\(highScoreViewManager.highScore)")
                                                .font(Font.custom("Louis George Cafe Bold", size: 38))
                                                .foregroundColor(.white)
                                                .kerning(-1)
                                        )
                                        .padding(.top, 88)
                                }
                            }
                            
                            ZStack{
                                Image("orangebg")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                            }
                            ZStack{
                                Image("brownbg")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                            }
                        }
                    }
                }
            }
        }
    }
        
}

#Preview {
    WelcomeScreen(highScoreViewManager: HighScoreViewModel())
}
