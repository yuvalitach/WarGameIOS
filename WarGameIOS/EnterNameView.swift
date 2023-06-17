//
//  EnterNameView.swift
//  WarGameIOS
//
//  Created by Student12 on 17/06/2023.
//
//
//  EnterNameView.swift
//  WarGame
//
//  Created by Student18 on 07/06/2023.
//

import SwiftUI

struct EnterNameView: View {
    @ObservedObject var viewModel: MainViewModel
   

    var body: some View {
        NavigationView{
            VStack{
                VStack {
                    //Header
                    Text("WAR GAME")
                        .font(.system(size: 40))
                        .foregroundColor(Color.green)
                        .bold()
                }.padding(.top, 30)

                //Name Form
                Form{
                
                    TextField("What is your name?",text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                
                //Button
                Button {
                    viewModel.setName()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.green)
                            .frame(width: 180, height: 50)
                        Text("Submit")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }.padding()
                
                Spacer()


            }
        }
    }
}

struct EnterNameView_Previews: PreviewProvider {
    static var previews: some View {
        EnterNameView(viewModel: MainViewModel())
    }
}
