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
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    coverView
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding([.leading, .top])
                    Text(model.name)
                        .font(.headline)
                        .padding(.leading)
                    Text(model.id)
                        .font(.subheadline)
                        .padding(.leading)
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
    }
    
    
    var coverView: some View {
        HStack{}
        .frame(width: screenWidth, height: 100)
        .background(Color.blue)
    }
}




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(model: ProfileModel().fetch())
    }
}
