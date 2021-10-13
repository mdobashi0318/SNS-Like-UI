//
//  HomeListRow.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/10.
//

import Foundation
import SwiftUI

struct HomeListRow: View {
    
    var model: HomeModel
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 30, height: 30)
                
            VStack(alignment: .leading) {
                HStack {
                    Text(model.name)
                    Text(model.id)
                }
                Text(model.detail)
                    .lineLimit(5)
            }
        }
    }
}


struct HomeListRow_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeListRow(model: HomeModel().fetch()[0])
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
