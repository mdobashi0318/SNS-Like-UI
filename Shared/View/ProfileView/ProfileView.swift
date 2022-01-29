//
//  ProfileView.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/15.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    var model: ProfileModel
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                coverView
                profileSection
                
                ForEach(0..<model.chat.count) { row in
                    NavigationLink(destination: {
                        DetailView(model: model.chat[row])
                    }) {
                        HomeListRow(model: model.chat[row])
                            .padding(.leading)
                    }
                }
            }
            Spacer()
        }
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.gray)
        })
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
    
    
    /// 画面上部のcover
    private var coverView: some View {
        HStack{}
        .frame(width: screenWidth, height: 100)
        .background(Color.blue)
    }
    
    
    /// プロフィール表示セクション
    private var profileSection: some View {
        VStack(alignment: .leading) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .padding([.leading, .top])
            Text(model.name)
                .font(.headline)
                .padding(.leading)
            Text(model.id)
                .font(.subheadline)
                .foregroundColor(Color.gray)
                .padding(.leading)
            Spacer(minLength: 5)
            Text(model.bio)
                .font(.subheadline)
                .padding(.leading)
        }
    }
    
}




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(model: ProfileModel().fetch())
//            .preferredColorScheme(.dark)
    }
}
