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
                Text("テキストを入力してください")
                    .frame(width: screenWidth / 1.1, height: 30, alignment: .leading)
                    .padding([.leading, .trailing])
                TextView(text: $viewModel.text)
                    .frame(width: screenWidth / 1.1, height: screenHeight, alignment: .leading)
                    .padding()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            cancelButton
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            addButton
                        }
                    }
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
                .modifier(CornerRadiusModifier(backgroundColor: viewModel.isEnableAddButton ?
                                               Color(UIColor.darkGray) : Color.blue,
                                               width: 60,
                                               height: 30)
                )
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
