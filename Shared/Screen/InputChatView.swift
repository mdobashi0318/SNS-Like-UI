//
//  InputChatView.swift
//  SNS Like UI
//
//  Created by 土橋正晴 on 2021/10/18.
//

import SwiftUI

struct InputChatView: View {
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @State var text: String = ""
    
    @ObservedObject var profile: ProfileViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                TextField("テキストを入力してください", text: $text)
                    .padding()
                    .navigationBarItems(leading: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    }, trailing: Button(action: {
                        if profile.addChat(detail: text) {
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            /// アラートを出す
                        }
                    }) {
                        Text("Add")
                            .frame(width: 60, height: 30)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(50 / 2)
                    })
            }
        }
        
    }
}



struct InputChatView_Previews: PreviewProvider {
    static var previews: some View {
        InputChatView(profile: ProfileViewModel())
    }
}
