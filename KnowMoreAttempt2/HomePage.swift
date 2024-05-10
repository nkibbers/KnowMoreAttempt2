//
//  HomeView.swift
//  
//
//  Created by Nadia Kiblisky on 5/4/24.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var name: String = ""
    @State private var isPlayButtonPressed = false
    @State private var selectedDifficulty: Int = 1
    
    let layout = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        ZStack {
            Image("whitebg")
                .resizable()
                .ignoresSafeArea()
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                
                ZStack {
                    Image("purplebg")
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    Button(action: {
                    }) {
                        Image("greenbg")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .mask(
                                Text("leader")
                                    .font(Font.custom("Mont-HeavyDEMO", size: 45))
                                    .foregroundColor(.white)
                                    .kerning(-1)
                            )
                            .position(x: 100, y: 80)
                        Image("greenbg")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .mask(
                                Text("board")
                                    .font(Font.custom("Mont-HeavyDEMO", size: 45))
                                    .kerning(-1)
                                    .position(x: 110, y: 125)
                            )
                    }
                }
                
                ZStack {
                    Image("yellowbg")
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    Button(action: {
                        isPlayButtonPressed.toggle()
                        print("Button tapped!")
                    }) {
                        ZStack{
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
                }
                ZStack {
                    Image("lightbluebg")
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    Button(action: {
            //add action
                    }) {
                        ZStack{
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
                }
            }
            .padding(.top, 100)
            
            VStack {
                Image("blackbg")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                    .mask(VStack(spacing: -40) {
                        Text("know\nmore")
                            .font(Font.custom("Mont-HeavyDEMO", size: 85))
                            .foregroundColor(.white)
                            .kerning(-1)
                    }
                    )
                    .position(x: 130, y: 100)
            }
        }
        .sheet(isPresented: $isPlayButtonPressed) {
            PlaySetup(name: $name, isPlayButtonPressed: $isPlayButtonPressed, selectedDifficulty: $selectedDifficulty)
        }
    }
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
