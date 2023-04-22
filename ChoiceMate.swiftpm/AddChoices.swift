//
//  AddChoices.swift
//  tesplayground
//
//  Created by Felicia Graciella on 17/04/23.
//

import SwiftUI

extension Color {
    public static let card = Color("card")
}

struct AddChoices: View {
    @State public var choices: [String] = []
    @State var textFieldText: String = ""
    @State var editc = false
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if choices.count < 1 {
                    Text("Add your choices!")
                        .padding(.bottom, 390)
                        .font(.system(size: 36))
                } else {
                    Text("Add your choices!")
                        .padding(.bottom)
                        .font(.system(size: 36))
                }
                
                ZStack {
                    ForEach(0..<choices.count, id: \.self) { index in
                        let card = choices[index]
                        
                        ZStack {
                            Image("cardback")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220, height: 340)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                .padding(.bottom)

                            Text(card)
                                .multilineTextAlignment(.center)
                                .frame(width: 150, height: 260)
                                .foregroundColor(.black)
                        }
                        .offset(x: ( CGFloat(index) * 10)
                                        , y: ( CGFloat(index) * 10))
                    }
                }
                .padding(50.0)
                
                TextField("Type here", text: $textFieldText)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 300, height: 48)
                    .overlay(
                            RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.black)
                            )
                    .disabled(choices.count >= 4)
                
                
                Button {
                    addTextToArray()
                } label: {
                    Text("Add")
                        .frame(width: 160, height: 48)
                        .buttonStyle(.bordered)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(48)
                        .padding()
                }
                .disabled(choices.count >= 4 || textFieldText == "")
                .alert(isPresented: $showAlert) {
                            Alert(title: Text("Input failed"), message: Text("Item already exists"), dismissButton: .default(Text("OK")))
                        }
                
                
                Button{
                    editc = true
                } label: {
                    Text("Edit")
                        .frame(width: 160, height: 48)
                        .buttonStyle(.bordered)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(48)
                        .padding(.bottom)
                        .sheet(isPresented: $editc, content: {
                            edit(choices: $choices)
                            .foregroundColor(.black)})
                }
                .disabled(choices.count < 1)
                
                if choices.count >= 2 {
                    NavigationLink(destination:  Done(choices: $choices)) {
                            Text("Done")
                            .frame(width: 160, height: 48)
                            .buttonStyle(.bordered)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(48)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func addTextToArray() {
        if textFieldText != "" {
            if choices.contains(textFieldText) {
                showAlert = true
            } else {
                choices.append(textFieldText)
            }
            textFieldText = ""
        }
    }
}

struct edit: View {
    @Binding var choices:[String]
    @Environment(\.dismiss) var dismiss
    
    let columns: [GridItem] = [
        GridItem(.fixed(250)),
        GridItem(.fixed(250))
    ]
    
    var body: some View {
        ZStack {
            Color.card.ignoresSafeArea(.all)
            
            if choices.count%2 == 0 {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0..<choices.count, id: \.self) { index in
                        let card = choices[index]
                        VStack {
                            ZStack{
                                Image("cardback")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 220, height: 340)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding(.bottom)
                                
                                Text(card)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 150, height: 260)
                                    .foregroundColor(.black)
                            }
                            
                            Button("delete"){
                                choices.remove(at: index)
                                
                                if choices.count < 1 {
                                    dismiss()
                                }
                            }
                            .padding(.bottom)
                            .foregroundColor(.red)
                        }
                    }
                }
            } else if choices.count == 1 {
                VStack {
                    ZStack{
                        Image("cardback")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 340)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding(.bottom)
                        
                        Text(choices[0])
                            .multilineTextAlignment(.center)
                            .frame(width: 150, height: 260)
                            .foregroundColor(.black)
                    }
                    
                    Button("delete"){
                        choices.remove(at: 0)
                        
                        if choices.count < 1 {
                            dismiss()
                        }
                    }
                    .padding(.bottom)
                    .foregroundColor(.red)
                }
            } else {
                VStack {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(0..<choices.count-1, id: \.self) { index in
                            let card = choices[index]
                            VStack {
                                ZStack{
                                    Image("cardback")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 220, height: 340)
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(.bottom)
                                    
                                    Text(card)
                                        .multilineTextAlignment(.center)
                                        .frame(width: 150, height: 260)
                                        .foregroundColor(.black)
                                }
                                
                                Button("delete"){
                                    choices.remove(at: index)
                                    
                                    if choices.count < 1 {
                                        dismiss()
                                    }
                                }
                                .padding(.bottom)
                                .foregroundColor(.red)
                            }
                        }
                    }
                    
                    VStack {
                        ZStack{
                            Image("cardback")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220, height: 340)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                .padding(.bottom)
                            
                            Text(choices[2])
                                .multilineTextAlignment(.center)
                                .frame(width: 150, height: 260)
                                .foregroundColor(.black)
                        }
                        
                        Button("delete"){
                            choices.remove(at: 2)
                            
                            if choices.count < 1 {
                                dismiss()
                            }
                        }
                        .padding(.bottom)
                        .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

struct AddChoices_Previews: PreviewProvider {
    static var previews: some View {
        AddChoices()
    }
}
