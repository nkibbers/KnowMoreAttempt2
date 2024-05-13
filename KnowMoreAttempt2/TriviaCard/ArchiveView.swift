//
//  ArchiveView.swift
//  KnowMoreAttempt2
//
//  Created by Rudra Parikh on 13/5/2024.
//

import SwiftUI

struct ArchiveView: View {
    
    let cards: [TriviaCard]
    let columnLayout = Array(repeating: GridItem() , count: 2)

    @State private var selectedCard: TriviaCard?
    
    var body: some View {
        
        ZStack{
            Image("yellowbg")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Text("Archives")
                    .font(Font.custom("Mont-HeavyDEMO", size: 60))
                    .foregroundColor(.white)
                    .kerning(-1)
                
                ScrollView {
                    LazyVGrid(columns: columnLayout) {
                        ForEach(cards) {card in
                            TriviaCardView(triviaCard: card, bgImageName: "blackbg")
                                .onTapGesture {
                                    selectedCard = card
                                }
                        }
                    }
                    .padding()
                    .sheet(item: $selectedCard) { card in
                        ExpandedCardView(triviaCard: card, bgImageName: "blackbg" ) {
                            selectedCard = nil
                        }
                    }
                    
                }
                
            }
        }
    }

}



#Preview {
    ArchiveView(cards: sampleTriviaData)
}
