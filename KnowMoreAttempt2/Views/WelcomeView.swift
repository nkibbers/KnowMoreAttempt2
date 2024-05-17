//
//  HomeView.swift
//  
//
//  Created by Nadia Kiblisky on 5/4/24.
//

import SwiftUI

struct WelcomeScreen: View {
    @StateObject var quizzoManager =  QuizzoManager()
    
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
                        Text("Welcome")
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
                            
                            Button(action: {
                                //                            isLeaderboardPresented.toggle()
                            }) {
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
                            
                            Button(action: {
                                //add action
                            }) {
                                ZStack{
                                    Image("lightbluebg")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                    
                                    Image("tangerinebg")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                        .mask(
                                            Text("archive")
                                                .font(Font.custom("Mont-HeavyDEMO", size: 40))
                                                .foregroundColor(.white)
                                                .kerning(-1)
                                        )
                                }
                            }
                            
                            ZStack {
                                Image("greenbg")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                VStack {
                                    Image("purplebg")
                                        .resizable()
                                        .frame(width: 200, height: 40)
                                        .mask(
                                            Text("score")
                                                .font(Font.custom("Mont-HeavyDEMO", size: 38))
                                                .foregroundColor(.white)
                                                .kerning(-1)
                                        )
                                    Image("purplebg")
                                        .resizable()
                                        .frame(width: 200, height: 40)
                                        .mask(
                                            Text("50")
                                                .font(Font.custom("Louis George Cafe Bold", size: 38))
                                                .foregroundColor(.white)
                                                .kerning(-1)
                                        )
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
    WelcomeScreen()
}
