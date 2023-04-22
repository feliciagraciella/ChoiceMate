//
//  Done.swift
//  tesplayground
//
//  Created by Felicia Graciella on 18/04/23.
//

import SwiftUI

struct Done: View {
    @Binding var choices:[String]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Click Random to shuffle your choices")
                    .padding(.bottom)
                    .font(.system(size: 36))
                
                ZStack {
                    ForEach(0..<choices.count) { index in
                        ZStack {
                            Image("cardfront")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220, height: 340)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                .padding(.bottom)
                        }
                        .offset(x: (CGFloat(index) * 10), y: (CGFloat(index) * 10))
                    }
                }
                .padding(50.0)
                
                NavigationLink(destination: MakeChoices(choices: $choices)) {
                    Text("Random")
                    .frame(width: 160, height: 48)
                    .buttonStyle(.bordered)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(48)
                    .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Done_Previews: PreviewProvider {
    static var previews: some View {
        Done(choices: .constant(["",""]))
    }
}
