import SwiftUI

struct PlaySetup: View {
    @Binding var name: String
    @Binding var isPlayButtonPressed: Bool
    @Binding var selectedDifficulty: Int
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("whitebg")
                    .resizable()
                    .ignoresSafeArea()
                VStack (alignment: .leading) {
                    Image("blackbg")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .mask {
                            Text("play")
                                .font(Font.custom("Mont-HeavyDEMO", size: 85))
                                .foregroundColor(.white)
                                .kerning(-1)
                        }
                        .padding(.top, 50)
                    
                    VStack {
                        TextField("Enter your player name", text: $name)
                            .foregroundColor(Color("KMBlack"))
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

                        LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 0) {
                            
                            ZStack {
                                Image("purplebg")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                VStack {
                                    Image("greenbg")
                                        .resizable()
                                        .frame(width: 200, height: 40)
                                        .mask(
                                            Text("difficulty")
                                                .font(Font.custom("Mont-HeavyDEMO", size: 38))
                                                .foregroundColor(.white)
                                                .kerning(-1)
                                        )
                                    Picker(selection: $selectedDifficulty, label: Text("Difficulty"))
                                    {
                                        Text("Easy").tag(1)
                                            .font(Font.custom("Mont-HeavyDemo", size: 17))
                                            .foregroundColor(Color("KMBlack"))
                                        Text("Medium").tag(2)
                                            .font(Font.custom("Mont-HeavyDemo", size: 17))
                                            .foregroundColor(Color("KMBlack"))
                                        Text("Difficult").tag(3)
                                            .font(Font.custom("Mont-HeavyDemo", size: 17))
                                            .foregroundColor(Color("KMBlack"))
                                    }
                                    .pickerStyle(.wheel)
                                    
                                    .frame(width: 175, height: 90)
                                    .foregroundColor(Color("KMBlack"))
                                }
                            }
                            
                            Button(action: {
                                isPlayButtonPressed.toggle()
                            }) {
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
                            
                            ZStack{
                                Image("lightbluebg")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                            }
                            
                            ZStack{
                                Image("greenbg")
                                    .resizable()
                                    .frame(width: 200, height: 200)
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
                            .navigationBarBackButtonHidden(true)
                            .navigationBarItems(
                                leading: Button(action: {
                                    isPlayButtonPressed = false
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

struct PlaySetup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySetup(name: .constant(""), isPlayButtonPressed: .constant(false), selectedDifficulty: .constant(1))
    }
}
