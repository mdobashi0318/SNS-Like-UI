//
//  HomeView.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/09.
//

import Foundation
import SwiftUI

struct HomeView: View {
        
    let model: [HomeModel] = [HomeModel(id: "id1", name: "name1", detail: "detail1"),
                              HomeModel(id: "id2", name: "name2", detail: "detail2"),
                              HomeModel(id: "id3", name: "name3", detail: "detail3"),
                              HomeModel(id: "id4", name: "name4", detail: "detail4")
    ]
    
    var body: some View {
        List {
            ForEach(0..<model.count) { row in
                NavigationLink(destination: {
                    Text(model[row].detail)
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
