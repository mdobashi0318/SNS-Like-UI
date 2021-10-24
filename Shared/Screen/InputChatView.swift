//
//  InputChatView.swift
//  SNS Like UI
//
//  Created by 土橋正晴 on 2021/10/18.
//

import SwiftUI

struct InputChatView: View {
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @ObservedObject var profile: ProfileViewModel
    
    @ObservedObject var viewModel: InputChatViewModel = InputChatViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                TextField("テキストを入力してください", text: $viewModel.text)
                    .padding()
                    .navigationBarItems(leading: cancelButton,
                                        trailing: addButton
                    )
            }
        }
    }
    
    
    var addButton: some View {
        Button(action: {
            if profile.addChat(detail: viewModel.text) {
                self.presentationMode.wrappedValue.dismiss()
            }
        }) {
            Text("Add")
                .frame(width: 60, height: 30)
                .background(viewModel.isEnableAddButton ? Color(UIColor.darkGray) : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(50 / 2)
        }
        .disabled(viewModel.isEnableAddButton)
    }
    
    
    var cancelButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Cancel")
        }
    }
}



struct InputChatView_Previews: PreviewProvider {
    static var previews: some View {
        InputChatView(profile: ProfileViewModel())
    }
}
