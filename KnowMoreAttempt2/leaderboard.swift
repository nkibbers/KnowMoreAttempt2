import SwiftUI

struct leaderboard: View {
    
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
                            
                            ZStack {
                                Image("purplebg")
                                    .resizable()
                                    .frame(width: .infinity, height: 100)
                                VStack {
                                    Image("greenbg")
                                        .resizable()
                                        .frame(width: 200, height: 40)
                                        .mask(
                                            Text("player1")
                                                .font(Font.custom("Mont-HeavyDEMO", size: 38))
                                                .foregroundColor(.white)
                                                .kerning(-1)
                                            
                                        )
                                }
                            }
                            
                            ZStack{
                                Image("yellowbg")
                                    .resizable()
                                    .frame(width: .infinity, height: 100)
                                
                                Image("orangebg")
                                    .resizable()
                                    .frame(width: 200, height: 100)
                                    .mask(
                                        Text("play")
                                            .font(Font.custom("Mont-HeavyDEMO", size: 38))
                                            .foregroundColor(.white)
                                            .kerning(-1)
                                    )
                            }
                            
                            ZStack{
                                Image("lightbluebg")
                                    .resizable()
                                    .frame(width: .infinity, height: 100)
                            }
                            
                            ZStack{
                                Image("greenbg")
                                    .resizable()
                                    .frame(width: .infinity, height: 100)
                            }
                            
                            ZStack{
                                Image("orangebg")
                                    .resizable()
                                    .frame(width: .infinity, height: 100)
                            }
                            ZStack{
                                Image("brownbg")
                                    .resizable()
                                    .frame(width: .infinity, height: 100)
                            }
                                                    .navigationBarBackButtonHidden(true)
                                                               .navigationBarItems(
                                                                   leading: Button(action: {
                                                                   }) {
                                                                       Image(systemName: "chevron.left")
                                                                           .foregroundColor(Color("KMBlack"))
                                                                   }
                                                               )
                        }
                    }
                }
            }
        }
    }
}

#Preview {leaderboard()}
