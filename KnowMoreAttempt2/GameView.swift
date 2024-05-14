//
//  ContentView.swift
//  AppForFun
//
//  Created by R on 13/5/2024.
//

import SwiftUI

struct GameView: View {
    var body: some View {

        var answers = ["697 BCE", "902 BCE", "753 BCE", "524 BCE"]

        VStack(spacing: 40) {

            VStack(alignment: .leading, spacing: 2) {
                
                Text("When was the city of Rome, Italy built ? ")
                    .font(.system(size: 22))
                    .foregroundStyle(Color(.black))
                    .bold()
                    .multilineTextAlignment(.center)
            }

            ForEach(answers, id: \.self)  { answer in
                HStack(spacing: 30) {
                Image(systemName: "circle")
                    .font(.caption)
                
                Text(answer)
                    .font(.system(size: 18))
                    .foregroundStyle(Color(.black))
                    .bold()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color(.lightGray))
                .background(.white)
                .cornerRadius(10)
                .shadow(color: .gray ,radius: 5)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.green))
        .navigationBarHidden(true)
    }
}

#Preview {
    GameView()
}