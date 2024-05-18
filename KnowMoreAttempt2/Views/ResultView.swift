//
//  ResultView.swift
//  KnowMoreAttempt2
//
//  Created by Ved Ketan Dave on 17/5/2024.
//

import SwiftUI

struct ResultScreen: View {
    @EnvironmentObject var manager: QuizzoManager
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if manager.reachedEnd {
            NavigationView {
                ZStack {
                    Image("whitebg")
                        .resizable()
                        .ignoresSafeArea()
                    VStack (alignment: .leading) {
                        Image("blackbg")
                            .resizable()
                            .frame(width: 300, height: 200)
                            .mask( VStack(spacing: -40)
                               {
                                Text("result")
                                    .font(Font.custom("Mont-HeavyDEMO", size: 64))
                                    .kerning(-1)
                                }
                            )
                        
                        VStack(spacing: 30) {
                            
                            VStack {
                                ResultCardView(card: CardData(title: "Score: ", value: manager.score))
                            }
                            
                            
                            Spacer()
                            
                            Button (action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                PrimaryButton(text: "Home")
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .navigationBarHidden(true)
                    }
                    .padding(.horizontal, 30)
                }
            }                
        } else {
            QuestionScreen()
                .environmentObject(manager)
        }
    }
}

#Preview {
    ResultScreen()
        .environmentObject(QuizzoManager())
}
