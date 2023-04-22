import SwiftUI

struct HomePage: View {
    @State var instruction = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500)
                    Text("Having trouble making decision?")
                        .font(.system(size: 32))
//                        .fontWeight(.bold)
                        .padding(.top, -40.0)
                    Text("We will help you!")
                        .font(.system(size: 32))
                        .padding(.bottom)
                    NavigationLink(destination: AddChoices()) {
                        Text("Go")
                            .padding()
                            .frame(width: 280, height: 52)
                            .buttonStyle(.bordered)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(48)
                            .padding([.top, .bottom])
                    }
                    
                    Button{
                        instruction = true
                    } label: {
                        Text("Instructions")
                            .padding()
                            .frame(width: 280, height: 52)
                            .buttonStyle(.bordered)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(48)
                            .sheet(isPresented: $instruction, content: {
                                Instruction().foregroundColor(.black)
                        })
                    }
                    .padding(.bottom, 90.0)
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}

struct Instruction: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.card.ignoresSafeArea(.all)
            
            VStack {
                Text("Instructions")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .padding(.bottom)
                Text("1. You can make up to 4 choices")
                    .font(.system(size: 24))
                Text("2. You can delete a choice if you want")
                    .font(.system(size: 24))
                Text("3. We will shuffle the choices for you")
                    .font(.system(size: 24))
                Text("4. You will choose one of the choices")
                    .font(.system(size: 24))
                Text("5. You got your decision!")
                    .font(.system(size: 24))
                Button(action: { dismiss() }) {
                    Text("I understand")
                        .foregroundColor(.blue)
                }
                .padding()
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

