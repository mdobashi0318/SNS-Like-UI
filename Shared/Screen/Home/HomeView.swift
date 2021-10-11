//
//  HomeView.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/09.
//

import Foundation
import SwiftUI

struct HomeView: View {
        
    let model: [HomeModel] = HomeModel().fetch()
    
    var body: some View {
        List {
            ForEach(0..<model.count) { row in
                NavigationLink(destination: {
                    DetailView(model: model[row])
                }) {
                    HomeListRow(model: model[row])
                }
            }
            
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
