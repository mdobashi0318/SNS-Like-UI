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
    
    var body: some View {
        NavigationView {
            TextField("テキストを入力してください", text: $text)
                .padding()
                .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }, trailing: Button(action: {
                    print("text:\(text)")
                    self.presentationMode.wrappedValue.dismiss()
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



struct InputChatView_Previews: PreviewProvider {
    static var previews: some View {
        InputChatView()
    }
}
