//
//  Final.swift
//  tesplayground
//
//  Created by Felicia Graciella on 18/04/23.
//

import SwiftUI

struct Final: View {
    @Binding var selected: String
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Yeay! you got a decision!")
                    .padding(.bottom)
                    .font(.system(size: 36))
                
                ZStack {
                    Image("cardback")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 340)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.bottom)

                    Text("\(selected)")
                        .multilineTextAlignment(.center)
                        .frame(width: 150, height: 260)
                        .foregroundColor(.black)
                }
                
                NavigationLink(destination: HomePage()) {
                    Text("Back to home")
                        .padding()
                        .frame(width: 280, height: 52)
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

struct Final_Previews: PreviewProvider {
    static var previews: some View {
        Final(selected: .constant(","))
    }
}
