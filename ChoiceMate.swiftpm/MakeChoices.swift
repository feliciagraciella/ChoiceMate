//
//  MakeChoices.swift
//  tesplayground
//
//  Created by Felicia Graciella on 18/04/23.
//

import SwiftUI

struct MakeChoices: View {
    @Binding var choices:[String]
    @State var selected = ""
    @State private var chosen = false
    
    let columns: [GridItem] = [
        GridItem(.fixed(250)),
        GridItem(.fixed(250))
    ]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Make your choice!")
                    .padding(.bottom)
                    .font(.system(size: 36))
                
                if choices.count%2 == 0 {
                    LazyVGrid(columns: columns) {
                        ForEach(choices, id: \.self) { index in
                            NavigationLink(destination: Final(selected: $selected)) {
                                Image("cardfront")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 220, height: 340)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding(.bottom)
                            }
                            .simultaneousGesture(TapGesture().onEnded {
                                selected = index
                            })
                        }
                    }
                    .onAppear {choices.shuffle()}
                    .padding()
                } else {
                    VStack{
                        LazyVGrid(columns: columns) {
                            ForEach(choices[0...1], id: \.self) { index in
                                NavigationLink(destination: Final(selected: $selected)) {
                                    Image("cardfront")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 220, height: 340)
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(.bottom)
                                }
                                .simultaneousGesture(TapGesture().onEnded {
                                    selected = index
                                })
                            }
                        }
                        
                        NavigationLink(destination: Final(selected: $selected)) {
                            Image("cardfront")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220, height: 340)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                .padding(.bottom)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            selected = choices[2]
                        })
                        .padding(.top)
                    }
                    .onAppear {choices.shuffle()}
                    .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct MakeChoices_Previews: PreviewProvider {
    static var previews: some View {
        MakeChoices(choices: .constant(["",""]))
    }
}
